class User < ApplicationRecord
  include ActiveModel::Validations

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

  validate :exist_rut?, on: :create

    def exist_rut?
      if role == "electric"
        unless Rut.where(rut: rut).present?
          errors.add(:rut, "El rut no está asociado a una certificación SEC")
        end
      end
    end 
  
  
end
