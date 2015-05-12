class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :sno
      t.date :admission_date
      t.string :patient_name
      t.string :patient_address
      t.string :patien_mobile_no
      t.string :patien_email
      t.date :trigger_date
      t.text :report
      t.string :referal_doctor
      t.string :appointment_type
      t.decimal :fees
      t.string :previous_sno_reference

      t.timestamps
    end
  end
end
