Gem::Specification.new do |s|
  s.name        = 'fitgem-app'
  s.version     = '2.0.0'
  s.date        = '2016-03-04'
  s.summary     = "Fitbit CLI"
  s.description = "A simple CLI Fitbit Client"
  s.authors     = ["Joseph Geis"]
  s.email       = 'geis28@gmail.com'
  s.files       = ["bin/fitgem"]
  s.executables << 'fitgem'
  s.homepage    =
    'http://juniorrubyist.github.io/fitgem'
  s.license       = 'MIT'
  s.add_runtime_dependency 'multi_json', '~> 1.11', '>= 1.11.2'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.post_install_message = "Please go to http://juniorRubyist.github.io/fitgem/authorize.html to get started."
end
