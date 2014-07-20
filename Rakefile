#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'yard'
require 'yard/rake/yardoc_task'
require 'rubocop/rake_task'

Files::Application.load_tasks

# clear
desc 'Delete doc/* **/#* **/*~ **/*.log tmp/*'
task :clean do
  system 'rm -fr doc/app'
  system 'rm -fr tmp/*'

  Dir.glob('**/*~').each { |f| FileUtils.rm f }
  Dir.glob('**/#*').each { |f| FileUtils.rm f }
  Dir.glob('**/*.log').each { |f| FileUtils.rm f }
end

YARD::Rake::YardocTask.new do |t|
  t.files = %w(
      app/models/**/*.rb
      app/controllers/**/*.rb
      app/helpers/**/*.rb
      app/mailers/**/*.rb
      lib/**/*.rb
    )
  t.options = []
  t.options = %w(--debug --verbose) if $trace
end

# rubocop
RuboCop::RakeTask.new

# tidy
desc 'Check coffee (using coffeelint)'
task :coffeelint do
  # npm install coffeelint -g
  system 'coffeelint .'
end

# selenium test
desc 'Auto accessing story'
task :selenium do
  FileUtils.rm_rf 'seleniun-screeshots'
  FileUtils.rm_rf 'seleniun-htmlshots'

  system 'bundle exec ruby selenium/story_all.rb'
end

# tidy
desc 'Check htmls (using tidy)'
task :tidy do
  Dir.glob('selenium-htmlpshots*/*.html').each do |f|
    puts "# ------- #{f}"
    system "tidy -e -q #{f} 2>&1 | fgrep -v 'content occurs after end of body'"
  end
end

# diff images
desc 'Diff scrennshoos latest and prev'
task :diff_images do
  FileUtils.rm_rf './diffs'
  system 'bundle exec ruby tools/make-diffs.rb ./selenium-screenshots-prev ./selenium-screenshots'
end

desc 'metrics'
task :metrics do
  system 'metric_fu'
end