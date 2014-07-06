#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
Files::Application.load_tasks

require 'rubocop/rake_task'

# clear
desc 'Delete doc/* **/#* **/*~ **/*.log tmp/*'
task :clean do
  system 'rm -fr doc/app'
  system 'rm -fr tmp/*'

  Dir.glob('**/*~').each { |f| FileUtils.rm f }
  Dir.glob('**/#*').each { |f| FileUtils.rm f }
  Dir.glob('**/*.log').each { |f| FileUtils.rm f }
end

# rubocop
RuboCop::RakeTask.new

# selenium test
desc 'Run test story'
task :selenium do
  FileUtils.rm_rf 'seleniun-screeshots'
  FileUtils.rm_rf 'seleniun-httpshots'

  system 'bundle exec ruby selenium/story_001.rb'
end

# tidi
desc 'Check htmls'
task :tidy do
  system 'tidy -e -q selenium-httpshots/*.html'
end
