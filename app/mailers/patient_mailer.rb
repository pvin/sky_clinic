class PatientMailer < ActionMailer::Base
  default from: "from@example.com"

  def trigger_email(patient_obj,msg)
    @msg = msg
    @patient_obj = patient_obj
    mail(:from => "Testmail@demo.com",
         :to => patient_obj.patien_email,
         :subject => "Reminder you to come for a therapy")
  end


end
