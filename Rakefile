require 'middleman-gh-pages'
require 'rake/clean'

CLOBBER.include('build')

task :default => [:build]

task :publish do
  sh('bundle exec middleman s3_sync -i')
end

Rake::Task[:publish].prerequisites.unshift "clobber"