class Equipment < ApplicationRecord
  self.table_name = 'equipments'
  SHAPES = ["(like) new", "very good shape", "a few bumps and scratches", "a bit old"]
  SIZES = ["37", "37.5", "38", "38.5", "39", "39.5", "40", "40.5", "41", "41.5", "42", "42.5", "43", "43.5", "44", "44.5", "45", "45.5", "46"]

  validates :title, presence: true
  validates :photo, presence: true
  validates :size, presence: true
  validates :shape, presence: true
  validates :daily_price, presence: true
  validates :location, presence: true

  validates :shape, inclusion: { in: SHAPES }
  validates :size, inclusion: { in: SIZES }

  belongs_to :user
  has_many :bookings

  mount_uploader :photo, PhotoUploader
end
