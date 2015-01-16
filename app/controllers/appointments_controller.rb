class AppointmentsController < ApplicationController

  before_action :get_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all.order("created_at DESC")
  end

  def new
    @appointment = Appointment.new appt_time: (Time.now + 1.day)
  end

  def show
  end

  def create
    @appointment = Appointment.new appointment_params
    if @appointment.save
      redirect_to @appointment
    else
      redirect_to new_appointment_path, notice: error_messages
    end 
  end

  def edit
  end

  def update
    if @appointment.update appointment_params
      redirect_to @appointment
    else
      redirect_to edit_appointment_path(@appointment), notice: error_messages
    end
  end

  def destroy
    if @appointment.destroy
      redirect_to appointments_path
    else
      redirect_to @appointment, notice: error_messages
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appt_time,:duration,:task,:details,:person)
  end

  def error_messages
    @appointment.errors.full_messages.join("; ")
  end

  def get_appointment
    @appointment = Appointment.find params[:id]
  end

end
