class Quatation < ApplicationRecord
  belongs_to :user
  belongs_to :electric, class_name: :User, foreign_key: :user_id
  belongs_to :detection

  enum state_mode: %i[accepted rejected waiting]
end
