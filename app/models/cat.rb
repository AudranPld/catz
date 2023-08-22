class Cat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :adress, presence: true
  validates :sex, presence: true
  validates :breed, presence: true
  validates :price, presence: true
  enum sex: { 'Male': 0, 'Female': 1 }
end
