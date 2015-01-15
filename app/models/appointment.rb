class Appointment < ActiveRecord::Base

  validates :duration, presence: true, numericality: true

end
