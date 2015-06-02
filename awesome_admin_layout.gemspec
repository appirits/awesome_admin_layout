lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'awesome_admin_layout/version'

Gem::Specification.new do |spec|
  spec.name          = 'awesome_admin_layout'
  spec.version       = AwesomeAdminLayout::VERSION
  spec.authors       = ['YOSHIDA Hiroki']
  spec.email         = ['hyoshida@appirits.com']
  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/appirits/awesome_admin_layout'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
