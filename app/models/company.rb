class Company < ApplicationRecord
  # Constant
  MAX_LENGTH_NAME = 150

  has_many :jobs, dependent: :destroy

  validates :name, presence: true, length: { maximum: MAX_LENGTH_NAME }
end
