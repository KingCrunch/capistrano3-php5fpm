namespace :load do
  task :defaults do
    set :php5fpm_pool, -> { "/etc/php5/fpm/pool.d" }
    set :php5fpm_template, -> { "#{fetch(:stage_config_path)}/#{fetch(:stage)}/php5fpm.conf.erb" }
  end
end

namespace :php5fpm do
  %w[start stop restart reload force-reload status].each do |command|
    desc "#{command.capitalize} php5-fpm service"
    task command do
      on release_roles :app do
        execute :sudo, :service, "php5-fpm", "#{command}"
      end
    end
  end

  namespace :pool do
    desc 'Creates the site configuration and upload it to the available folder'
    task :add do
      on release_roles :app do
        within fetch(:php5fpm_pool) do
          config_file = fetch(:php5fpm_template)
          config = ERB.new(File.read(config_file)).result(binding)
          upload! StringIO.new(config), '/tmp/php5fpm.conf'

          execute :sudo, :mv, '/tmp/php5fpm.conf', "#{fetch(:application)}.conf"
        end
      end
    end

    desc 'Removes the site removing the configuration file from the available folder'
    task :remove do
      on release_roles :app do
        if test "[ -f #{fetch(:php5fpm_pool)}/#{fetch(:application)}.conf ]"
          within fetch(:php5fpm_pool) do
            execute :sudo, :rm, "#{fetch(:application)}.conf"
          end
        end
      end
    end
  end
end
