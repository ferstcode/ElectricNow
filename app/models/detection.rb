class Detection < ApplicationRecord
  belongs_to :user
  has_many :quatations
  has_one_attached :image
end
