class Event < ApplicationRecord
  validates :price,
  presence: true
  validates :user,
  presence: true,
  uniqueness: true
  validates :start_date,
  presence:  true
  validates :duration,
  presence: true
  validates :title,
  presence: true
  validates :description,
  presence: true
  validates :location,
  presence: true
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user
end
