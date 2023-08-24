class Cat < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  validates :adress, presence: true
  validates :gender, presence: true
  validates :breed, presence: true
  validates :price, presence: true
  validates :name, presence: true
  has_one_attached :photo
  enum gender: { male: 'Male', female: 'Female' }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_breed,
    against: [ :name, :breed ],
    using: {
      tsearch: { prefix: true }
    }
end
