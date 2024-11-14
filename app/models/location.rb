class Location < ApplicationRecord
    has_many :jobs_locations
    has_many :jobs, through: :jobs_locations
end
