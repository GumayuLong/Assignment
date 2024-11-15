class Job < ApplicationRecord
  enum job_type: { full_time: 1, part_time: 2, freelance: 3 }
  belongs_to :company
  has_many :jobs_locations
  has_many :locations, through: :jobs_locations
  has_many :applications, dependent: :destroy


  validates :title, presence: true
  validates :job_type, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
