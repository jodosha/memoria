require "rubygems"
require "spec/rake/spectask"
require File.join(File.dirname(__FILE__), "memoria")
load    File.join(File.dirname(__FILE__), "tasks", "gem.rake")

begin
  require "jeweler"
  Jeweler::Tasks.new do |gemspec|
    gemspec.name        = "memoria"
    gemspec.summary     = "Web interface for Redis stats"
    gemspec.description = "Web interface for Redis stats"
    gemspec.email       = "guidi.luca@gmail.com"
    gemspec.homepage    = "http://github.com/jodosha/memoria"
    gemspec.authors     = [ "Luca Guidi" ]
    gemspec.executables = [ "memoria" ]
    gemspec.add_dependency "sinatra"
    gemspec.add_dependency "redis"
    gemspec.add_dependency "dm-core"
    gemspec.add_dependency "dm-validations"
    gemspec.add_dependency "eventmachine"
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

task :default => :spec
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new(:rcov) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
end

namespace :db do
  task :connect do
    Memoria.data_mapper_setup
  end

  desc "Auto migrate the database"
  task :migrate => :connect do
    DataMapper.auto_migrate!
  end
end
