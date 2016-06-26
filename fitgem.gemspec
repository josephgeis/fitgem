Gem::Specification.new do |s|
  s.name        = 'fitgem-app'
  s.version     = '2.3.1-deprecated'
  s.date        = '2016-03-16'
  s.summary     = "Fitbit CLI"
  s.description = "A simple CLI Fitbit Client. This is an old version and a new version is coming soon. Look forward to fitgem-lib!"
  s.authors     = ["Joseph Geis"]
  s.email       = 'geis28@gmail.com'
  s.files       = ["bin/fitgem"]
  s.executables << 'fitgem'
  s.homepage    =
    'http://fitgem.tk'
  s.license       = 'MIT'
  s.add_runtime_dependency 'multi_json', '~> 1.11', '>= 1.11.2'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.post_install_message = "Please go to http://fitgem.tk/authorize.html to get started."
end
