Gem::Specification.new do |s|
  s.name        = 'simplereq'
  s.version     = '1.0.3'
  s.date        = '2016-11-21'
  s.summary     = "Simple requests library for Ruby."
  s.description = "A simple requests library for Ruby."
  s.authors     = ["Gabe Dunn"]
  s.email       = 'gabe@redxtech.ca'
  s.files       = ["lib/simplereq.rb"]
  s.homepage    = 'https://github.com/RedXTech/simplereq'
  s.license     = 'Apache-2.0'
  s.required_ruby_version = '>= 2.0.0', '~> 2'
  s.add_runtime_dependency 'rest-client', '~>2.0', '>= 2.0.0'
  s.add_runtime_dependency 'json', '~>1.8', '>= 1.8.3'
  s.add_runtime_dependency 'hpricot', '~>0.8', '>= 0.8.6'
end