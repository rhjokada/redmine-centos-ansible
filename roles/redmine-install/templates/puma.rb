app_root = '{{ redmine_dir }}'
app_log_dir = '{{ redmine_log_dir }}'

directory app_root
environment 'production'
pidfile "#{app_root}/tmp/puma/puma.pid"
state_path "#{app_root}/tmp/puma/puma.state"
bind "unix://#{app_root}/tmp/sockets/redmine.sock"
activate_control_app

stdout_redirect "#{app_log_dir}/log/puma.stdout.log", "#{app_log_dir}/log/puma.stderr.log"
