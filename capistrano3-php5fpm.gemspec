# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'capistrano3-php5fpm'
  gem.version       = '0.1.1'
  gem.authors       = ['Sebastian Krebs']
  gem.email         = ['sebastian@krebs.one']
  gem.description   = %q{Adds support to php5-fpm for Capistrano 3.x}
  gem.summary       = %q{Adds support to php5-fpm for Capistrano 3.x}
  gem.homepage      = 'https://github.com/KingCrunch/capistrano3-php5fpm'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ['lib']

  gem.add_dependency 'capistrano', '>= 3.0.0'
end
