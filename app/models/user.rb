class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :detections
  has_many :quatations
  has_many :client_messages, class_name: :Message, foreign_key: :client_id
  has_many :electric_messages, class_name: :Message, foreign_key: :electric_id
  has_many :client_qualifications, class_name: :Qualification, foreign_key: :client_id
  has_many :electric_qualifications, class_name: :Qualification, foreign_key: :electric_id
  has_one_attached :image
  enum role: %i[client electric guest]
  scope :electrics, -> { where(role: :electric) }
 
  
end
