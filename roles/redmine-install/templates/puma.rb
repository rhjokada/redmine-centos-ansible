app_root = '{{ redmine_dir }}'

directory app_root
environment 'production'
pidfile "#{app_root}/tmp/puma/puma.pid"
state_path "#{app_root}/tmp/puma/puma.state"
bind "unix://#{app_root}/tmp/sockets/redmine.sock"
activate_control_app

stdout_redirect "#{app_root}/puma.stdout.log", "#{app_root}/puma.stderr.log"

# threads
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
# workers
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
