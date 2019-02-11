class Event < ApplicationRecord
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
  validates :user,  presence: true
  validates :start_date, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :location,  presence: true
  validates :duration, presence: true, numericality: { only_integer: true }, if: :multiple_of_5
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user

  validate :start_date_cannot_be_in_the_past
  def start_date_cannot_be_in_the_past
   errors.add(:start_date, "can't be in the past") if
     !start_date.blank? and start_date < Time.now
 end

   def multiple_of_5
    if duration % 5 == 0
      return true
    else
      return false
    end
  end

end
