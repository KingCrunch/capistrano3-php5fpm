# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano3-php5fpm'
  spec.version       = '0.1.0'
  spec.authors       = ['Sebastian Krebs']
  spec.email         = ['krebs.seb@gmail.com']
  spec.description   = %q{Adds suuport to php5-fpm for Capistrano 3.x}
  spec.summary       = %q{Adds suuport to php5-fpm for Capistrano 3.x}
  spec.homepage      = 'https://github.com/KingCrunch/capistrano-php5fpm'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0'

  spec.add_development_dependency 'rake'
end
