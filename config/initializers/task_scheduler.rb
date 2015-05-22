require 'rubygems'
require 'rake'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
scheduler.cron '2 11 * * *' do
  system 'bundle exec rake email:call_mailer'
end

