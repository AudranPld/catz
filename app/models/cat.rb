class Cat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :adress, presence: true
  validates :sex, presence: true
  validates :breed, presence: true
  validates :price, presence: true
  enum sex: { male: 'Male', female: 'Female' }
end
