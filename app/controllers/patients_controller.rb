class PatientsController < ApplicationController
  #before_action :set_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @patients = Patient.all
    respond_with(@patients)
  end

  def show
    respond_with(@patient)
  end

  def new
    @patient = Patient.new
    respond_with(@patient)
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    respond_with(@patient)
  end

  def update
    @patient.update(patient_params)
    respond_with(@patient)
  end

  def destroy
    @patient.destroy
    respond_with(@patient)
  end

  def search
    @search = Patient.search() do
      keywords('dzs')
    end
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:sno, :admission_date, :patient_name, :patient_address, :patien_mobile_no, :patien_email, :trigger_date, :report, :referal_doctor, :appointment_type, :fees, :previous_sno_reference)
    end
end
