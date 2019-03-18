class Quatation < ApplicationRecord
  belongs_to :user
  belongs_to :electric, class_name: :User, foreign_key: :user_id
  belongs_to :detection
  has_many :messages, dependent: :delete_all

  enum state_mode: %i[accepted rejected waiting]

  def unread_messages_for(user)
    if user.client?
      messages.where(read: false, client_id: nil).count
    elsif user.electric?
      messages.where(read: false, electric_id: nil).count
    end
  end
end
