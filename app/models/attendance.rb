class Attendance < ApplicationRecord
  validates :user,
  presence: true
  validates :event,
  presence: true
  validates :stripe_customer_id,
  presence: true,
  uniqueness: true
  belongs_to :event
  belonngs_to :user
end
