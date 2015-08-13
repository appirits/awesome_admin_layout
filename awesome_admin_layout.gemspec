lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'awesome_admin_layout/version'

Gem::Specification.new do |spec|
  spec.name          = 'awesome_admin_layout'
  spec.version       = AwesomeAdminLayout::VERSION
  spec.authors       = ['YOSHIDA Hiroki']
  spec.email         = ['hyoshida@appirits.com']
  spec.summary       = 'Providing a simple way to add admin panel layout.'
  spec.description   = 'AwesomeAdminLayout provides a simple way to add admin panel layout to your application.'
  spec.homepage      = 'https://github.com/appirits/awesome_admin_layout'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'slim', '~> 3.0', '>= 3.0.6'
  spec.add_dependency 'sass', '~> 3.4', '>= 3.4.14'
  spec.add_dependency 'coffee-script', '~> 2.4', '>= 2.4.1'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'sinatra', '~> 1.4', '>= 1.4.6'
  spec.add_development_dependency 'rails', '>= 3.2.0', '< 5'
  spec.add_development_dependency 'minitest', '>= 4.2.0', '<= 5.7'
end
