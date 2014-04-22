# Capistrano::php5fpm

php5-fpm support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano3-php5fpm', '~> 0.1', :github => 'KingCrunch/capistrano3-php5fpm'
gem 'capistrano'
```

And then execute:

```bash
bundle
```

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/php5fpm'
```

You will get the following tasks

```bash
cap php5fpm:start                    # Start php5-fpm service
cap php5fpm:stop                     # Stop php5-fpm service
cap php5fpm:reload                   # Reload php5-fpm service
cap php5fpm:restart                  # Restart php5-fpm service
cap php5fpm:pool:add                 # Creates the site configuration and upload it to the available folder
cap php5fpm:pool:remove              # Removes the site removing the configuration file from the available folder
```

```ruby
# (Remote) path to php5-fpms pool folder
set :php5fpm_pool, "/etc/php5/fpm/pool.d"

# Pool configuration template
set :php5fpm_template, "#{fetch(:stage_config_path)}/#{fetch(:stage)}/php5fpm.conf.erb"
```
