class Cat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :adress, presence: true
  validates :gender, presence: true
  validates :breed, presence: true
  validates :price, presence: true
  validates :name, presence: true
  enum gender: { male: 'Male', female: 'Female' }
end
