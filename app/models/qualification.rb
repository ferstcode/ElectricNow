class Qualification < ApplicationRecord

  belongs_to :client, class_name: :User, foreign_key: :user_id
  belongs_to :electric, class_name: :User, foreign_key: :user_id
end
