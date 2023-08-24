class Cat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  validates :address, presence: true
  validates :gender, presence: true
  validates :breed, presence: true
  validates :price, presence: true
  validates :name, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  enum gender: { male: 'Male', female: 'Female' }
end
