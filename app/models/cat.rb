class Cat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  validates :adress, presence: true
  validates :gender, presence: true
  validates :breed, presence: true
  validates :price, presence: true
  validates :name, presence: true
  has_one_attached :image
  enum gender: { male: 'Male', female: 'Female' }
end
