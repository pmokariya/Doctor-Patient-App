# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Doctor < ActiveRecord::Base
	has_many :doctor_patients
	has_many :patients, through: :doctor_patients
	has_many :appointments, through: :doctor_patients


	has_many :completed_appointments,  -> { where(completed: true)}, 
		through: :doctor_patients,
		source: :appointments
end
