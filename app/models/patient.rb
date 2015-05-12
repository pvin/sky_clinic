class Patient < ActiveRecord::Base
  validates :patient_name, :presence => true
  validates :patient_address, :presence => true
  validates :patien_mobile_no, :presence => true
  validates :report, :presence => true
  validates :appointment_type, :presence => true
  validates :fees, :presence => true
  validates :patien_email, :presence => true

  searchable do
    text :patient_name, :default_boost => 2
  end
end
