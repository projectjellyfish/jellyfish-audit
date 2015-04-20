$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'jellyfish_audit/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'jellyfish-audit'
  s.version     = JellyfishAudit::VERSION
  s.authors     = ['mafernando']
  s.email       = ['fernando_michael@bah.com']
  s.homepage    = 'http://www.projectjellyfish.org/'
  s.summary     = 'Jellyfish Audit'
  s.description = 'Adds audit support to Project Jellyfish'
  s.license     = 'APACHE'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.1'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir["spec/**/*"]
end
