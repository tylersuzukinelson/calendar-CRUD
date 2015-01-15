class AppointmentsController < ApplicationController

  def index

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

  private

  def appointment_params
    params.require(:appointment).permit(:appt_time,:duration,:task,:details,:person)
  end

  def error_messages
    @appointment.errors.full_messages.join("; ")
  end

end
