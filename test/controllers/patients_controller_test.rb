require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { admission_date: @patient.admission_date, appointment_type: @patient.appointment_type, fees: @patient.fees, patien_email: @patient.patien_email, patien_mobile_no: @patient.patien_mobile_no, patient_address: @patient.patient_address, patient_name: @patient.patient_name, previous_sno_reference: @patient.previous_sno_reference, referal_doctor: @patient.referal_doctor, report: @patient.report, sno: @patient.sno, trigger_date: @patient.trigger_date }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { admission_date: @patient.admission_date, appointment_type: @patient.appointment_type, fees: @patient.fees, patien_email: @patient.patien_email, patien_mobile_no: @patient.patien_mobile_no, patient_address: @patient.patient_address, patient_name: @patient.patient_name, previous_sno_reference: @patient.previous_sno_reference, referal_doctor: @patient.referal_doctor, report: @patient.report, sno: @patient.sno, trigger_date: @patient.trigger_date }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
