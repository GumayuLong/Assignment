class Job < ApplicationRecord
  belongs_to :company
  has_many :jobs_locations
  has_many :locations, through: :jobs_locations

  enum job_type: { 'Full-time': 1, 'Part-time': 2, 'Freelance': 3 }

  validates :title, presence: true
  validates :job_type, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
