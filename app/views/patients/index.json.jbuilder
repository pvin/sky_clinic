json.array!(@patients) do |patient|
  json.extract! patient, :id, :sno, :admission_date, :patient_name, :patient_address, :patien_mobile_no, :patien_email, :trigger_date, :report, :referal_doctor, :appointment_type, :fees, :previous_sno_reference
  json.url patient_url(patient, format: :json)
end
