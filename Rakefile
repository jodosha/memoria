require "rubygems"
require "rake"
require "rake/testtask"
require "rake/rdoctask"
require "spec/rake/spectask"

GEM_NAME = "memoria"
MEMORIA_VERSION = "0.0.1"

task :default => :spec

desc 'Build and install the gem (useful for development purposes).'
task :install do
  system "gem build memoria.gemspec"
  system "sudo gem uninstall #{GEM_NAME}"
  system "sudo gem install --local --no-rdoc --no-ri #{GEM_NAME}-#{MEMORIA_VERSION}.gem"
  system "rm #{GEM_NAME}-*.gem"
end

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end

desc 'Show the file list for the gemspec file'
task :files do
  puts "Files:\n #{Dir['**/*'].reject {|f| File.directory?(f)}.sort.inspect}"
  puts "Test files:\n #{Dir['spec/**/*_spec.rb'].reject {|f| File.directory?(f)}.sort.inspect}"
end

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new(:rcov) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
end
