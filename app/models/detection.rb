class Detection < ApplicationRecord
  belongs_to :user
  has_many :quatations
end
