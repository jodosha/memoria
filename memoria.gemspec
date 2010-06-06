Gem::Specification.new do |s|
  s.name               = "memoria"
  s.version            = "0.0.1"
  s.date               = "2009-06-13"
  s.summary            = "Web interface for Redis stats"
  s.author             = "Luca Guidi"
  s.email              = "guidi.luca@gmail.com"
  s.homepage           = "http://lucaguidi.com"
  s.description        = "Web interface for Redis stats"
  s.has_rdoc           = true
  s.executables        = [ 'memoria' ]
  s.files              = ["README.textile", "Rakefile", "app/base.rb", "app/core_ext.rb", "app/core_ext/bytes.rb", "app/helpers.rb", "app/helpers/number.rb", "app/models.rb", "app/models/server.rb", "app/system.rb", "app/web.rb", "bin/memoria", "config.ru", "memoria.gemspec", "memoria.rb", "memoria.yml.example", "public/stylesheets/application.css", "spec/app/models/server_spec.rb", "spec/app/web_spec.rb", "spec/env.rb", "tasks/gem.rake", "views/index.erb", "views/layout.erb", "views/new.erb"]
  s.test_files         = ["spec/app/models/server_spec.rb", "spec/app/web_spec.rb"]
  s.extra_rdoc_files   = ['README.textile']
end
