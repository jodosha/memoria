GEM_NAME = "memoria"
MEMORIA_VERSION = "0.0.1"

desc 'Build and install the gem locally.'
task :install do
  system "gem build memoria.gemspec"
  system "sudo gem uninstall #{GEM_NAME}"
  system "sudo gem install --local --no-rdoc --no-ri #{GEM_NAME}-#{MEMORIA_VERSION}.gem"
  system "rm #{GEM_NAME}-*.gem"
end

desc 'Show the file list for the gemspec file'
task :files do
  puts "Files:\n #{Dir['**/*'].reject {|f| File.directory?(f)}.sort.inspect}"
  puts "Test files:\n #{Dir['spec/**/*_spec.rb'].reject {|f| File.directory?(f)}.sort.inspect}"
end

namespace :redis do
  desc 'Start the Redis cluster'
  task :start => :clean do
    system "redis-server spec/config/single.conf"
  end

  desc 'Stop the Redis cluster'
  task :stop do
    # TODO replace with:
    # system "kill -9 `tmp/redis-single.pid`"
    system "ps -eo pid,comm | grep redis | xargs kill -9"
  end

  desc 'Clean the tmp/ directory'
  task :clean do
    system "rm tmp/*" rescue nil
  end
end
