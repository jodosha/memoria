require "spec/rake/spectask"
require File.join(File.dirname(__FILE__), "memoria")
load    File.join(File.dirname(__FILE__), "tasks", "gem.rake")

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
    Memoria.new
  end
  
  desc "Auto migrate the database"
  task :migrate => :connect do
    DataMapper.auto_migrate!
  end
end
