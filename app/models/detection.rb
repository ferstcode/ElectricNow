class Detection < ApplicationRecord
  belongs_to :user
  belongs_to :client, class_name: :User, foreign_key: :user_id
  has_many :quatations
  has_one_attached :image
end
