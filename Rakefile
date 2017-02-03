require 'middleman-gh-pages'
require 'rake/clean'

CLOBBER.include('build')

task :default => [:build]

task publish: [:clean, :build] do
  if ENV['S3_BUCKET']
    sh('bundle exec middleman s3_sync -i')
  else
    puts "WARNING: Not pushing to S3, since S3_BUCKET is not set"
  end
end