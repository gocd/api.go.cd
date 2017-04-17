require 'active_support/core_ext/string/strip'
require 'json'
require 'erb'

desc "bump version"
task :bump_version do

  def env(key)
    value = ENV[key].to_s.strip
    fail "Please specify #{key}" if value == ''
    value
  end
  remote_name = env('REMOTE_NAME')
  repo_url = `git config --get remote.#{remote_name}.url`.strip

  $stderr.puts "*** Setting up gh-pages branch for next release"
  rm_rf "build"
  sh("git clone #{repo_url} build --branch gh-pages --depth 1 --quiet")

  current_version = File.readlink('build/current')
  version_to_release = env('VERSION_TO_RELEASE')
  next_version = env('NEXT_VERSION')

  if [Gem::Version.new(current_version), Gem::Version.new(version_to_release), Gem::Version.new(next_version)].sort.collect(&:to_s) != [current_version, version_to_release, next_version]
    fail "CURRENT_VERSION VERSION_TO_RELEASE and NEXT_VERSION don't seem right"
  end

  cd "build" do
    rm 'current'
    ln_sf version_to_release, "./current"
    versions = JSON.parse(File.read("versions.json"), symbolize_names: true)

    versions.delete_if do |version_data|
      version_data[:version] == next_version
    end

    versions.each do |version_data|
      version_data.delete(:type)

      if version_data[:version] == version_to_release
        version_data[:type] = 'latest'
      end
    end

    next_version_data = {
      version: next_version,
      location: "https://api.gocd.io/#{next_version}/",
      type: "next"
    }

    versions.unshift(next_version_data)

    open('versions.json', 'w') {|f| f.puts(JSON.pretty_generate(versions))}

    open('index.html', 'w') do |f|
      erb = ERB.new(File.read("#{File.dirname(__FILE__)}/../lib/root.html.erb"), nil, '-')
      html = erb.result(binding)
      f.puts(html)
    end
    open('robots.txt', 'w') do |f|
      erb = ERB.new(File.read("#{File.dirname(__FILE__)}/../lib/robots.txt.erb"), nil, '-')
      html = erb.result(binding)
      f.puts(html)
    end
    sh("git add current versions.json index.html robots.txt")
    sh("git commit -m 'Add new version to dropdown'")
    sh("git push")
  end

  $stderr.puts("*** Creating branch for - #{version_to_release}")
  sh("git checkout master")
  sh("git checkout -b release-#{version_to_release}")
  sh("git push #{remote_name} release-#{version_to_release}")
  sh("git checkout master")

  $stderr.puts "Bumping version in lib/version.rb"
  open('lib/version.rb', 'w') do |f|
    f.puts("# this file is updated automatically using a rake task, any changes will be lost")
    f.puts("GOCD_VERSION = '#{next_version}'")
  end

  sh('git add lib/version.rb')
  sh("git commit -m 'bump version to #{next_version}'")
  sh("git push #{remote_name} master")
end
