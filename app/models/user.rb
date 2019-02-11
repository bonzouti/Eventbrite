class User < ApplicationRecord
  validates :first_name,
  presence: true
  validates :last_name,
  presence: true
  validates :description,
  presence: true
  has_many :events
  has_many :attendances
  has_many :events, through: :attendances
end
