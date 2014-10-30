# encoding: UTF-8
require 'tailor/rake_task'
require 'foodcritic'
require 'rspec/core/rake_task'
require 'daptiv-chef-ci/vagrant_task'

task default: [:version, :tailor, :foodcritic, :spec]

task :version do
  IO.write(
    'version.txt',
    (
      ENV['BUILD_NUMBER'] ? "0.1.#{ENV['BUILD_NUMBER']}" : '0.1.0'
    )
  )
end

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.rspec_opts = ['--color', '-f documentation']
  task.rspec_opts << '-tunit'
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = {
    cookbook_paths: '.',
    search_gems: true
  }
end

Tailor::RakeTask.new
Vagrant::RakeTask.new
