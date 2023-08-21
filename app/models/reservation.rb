class Reservation < ApplicationRecord
  belongs_to :cat
  belongs_to :user
  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
