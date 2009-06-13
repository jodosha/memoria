Gem::Specification.new do |s|
  s.name               = "memoria"
  s.version            = "0.0.1"
  s.date               = "2009-06-12"
  s.summary            = "Statistics for Redis"
  s.author             = "Luca Guidi"
  s.email              = "guidi.luca@gmail.com"
  s.homepage           = "http://lucaguidi.com"
  s.description        = "Statistics for Redis"
  s.has_rdoc           = false
  s.files              = ["Rakefile", "app/base.rb", "app/system.rb", "app/web.rb", "config.ru", "memoria.gemspec", "memoria.rb", "spec/app/system_spec.rb", "spec/env.rb", "spec/memoria_spec.rb", "views/index.erb", "views/layout.erb"]
  s.test_files         = ["spec/app/system_spec.rb", "spec/memoria_spec.rb"]
end
