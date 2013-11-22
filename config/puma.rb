#https://github.com/puma/puma/blob/master/examples/config.rb
app_path =  "/home/deployer/apps/topdeveloper/shared"
environment 'production'
state_path "#{app_path}/pids/puma.state"
threads 0, 16
bind "unix://#{app_path}/sockets/puma.sock"
workers 3
daemonize true
preload_app!
stdout_redirect "#{app_path}/logs/puma.std.log", "#{app_path}/logs/puma.stderr.log"
# Command to use to restart puma. This should be just how to
# load puma itself (ie. 'ruby -Ilib bin/puma'), not the arguments
# to puma, as those are the same as the original process.
#
# restart_command '/u/app/lolcat/bin/restart_puma'

# === Cluster mode ===

# How many worker processes to run.
#
# The default is “0”.
#
# workers 2

# Code to run when a worker boots to setup the process before booting
# the app.
#
# This can be called multiple times to add hooks.
#
# on_worker_boot do
#   puts 'On worker boot...'
# end
#https://github.com/puma/puma/blob/master/examples/config.rb
# current_path = File.basename(Dir.getwd)
# preload_app!
# environment 'production'
# state_path "#{current_path}/tmp/pids/puma.state"
# threads 0, 16
# bind "unix://tmp/sockets/puma.sock"
# workers 3
# daemonize true
# stdout_redirect "#{current_path}/log/production.log", "#{current_path}/log/puma.stderr.l
