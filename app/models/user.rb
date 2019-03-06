class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :detections
  has_many :quatations
  has_many :califications
  has_one_attached :image
  enum role: %i[client electric guest]
  
end
