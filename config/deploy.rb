set :application, "asinatraapp"
set :host, "edgeip.com"
set :user, "paul"


set :repository,  "git@github.com:paulanthonywilson/asinatraapp.git"

set :scm, :git
set :deploy_via, :remote_cache


role :app, host
role :web, host



set :use_sudo, false
set :deploy_to, "/var/www/apps/#{application}"
ssh_options[:forward_agent] = true


namespace :deploy do
  desc "Restarting passenger with restart.txt"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with passenger"
    task t, :roles => :app do ; end
  end
  
  task :cold do
    deploy.update
    deploy.start
  end
  
end



