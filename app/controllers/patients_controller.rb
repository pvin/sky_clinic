class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @patients = Patient.paginate(:page => params[:page], :per_page => 10)
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

  def create_pdf
    @patient = Patient.find(params[:id])
    pdf = Prawn::Document.new

    pdf.fill_color "0066FF"
    pdf.font_size 22
    pdf.text_box "Sky Speech & Hearing Care Report", :align => :right
    pdf.move_down 40
    pdf.font_size 18
    pdf.text ("Below generated report for  #{@patient['patient_name']}")
    pdf.move_down 20
    pdf.font_size 14
    item = ["Patient Name : #{@patient['patient_name']}", "Admission Date : #{@patient['admission_date']}",
            "Address : #{@patient['patient_address']}", "Phone Number : #{@patient['patien_mobile_no']}",
            "Patient Email : #{@patient['patien_email']}", "Report : #{@patient['report']}",
            "Appointment Type : #{@patient['appointment_type']}"]
    item.each { |i| pdf.text "#{i}"
    pdf.move_down 10 }
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end

  def collection
  end

  def daily_collection
    if current_user.id == 1
      @total = Patient.daily_collection_scope.summation
      respond_to do |format|
        format.js
      end
    else
      @total = 0
    end
  end

  def monthly_collection
    if current_user.id == 1
      @total = Patient.monthly_collection_scope.summation
      respond_to do |format|
        format.js
      end
    else
      @total = 0
    end
  end

  def yearly_collection
    if current_user.id == 1
      @total = Patient.monthly_collection_scope.summation
      respond_to do |format|
        format.js
      end
    else
      @total = 0
    end
  end

  def trigger_action_mailer
    @email_list = Patient.email_list_scope
    if !@email_list.empty?
      @email_list.each do |patient_obj| PatientMailer.trigger_email(patient_obj,'SKY Speech & Hearing').deliver!
      end
    end
  end

  def todays_list
    @email_list = Patient.email_list_scope
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:sno, :admission_date, :patient_name, :patient_address, :patien_mobile_no, :patien_email,
                                      :trigger_date, :report, :attachment, :attachment1, :referal_doctor, :appointment_type,
                                      :fees, :previous_sno_reference, :accessories_list,:accessories_price)
    end

end
