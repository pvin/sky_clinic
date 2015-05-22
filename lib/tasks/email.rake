namespace :email do
  desc "call a mailer"
  task :call_mailer => :environment do
    patient_object = PatientsController.new
    patient_object.trigger_action_mailer
  end
end