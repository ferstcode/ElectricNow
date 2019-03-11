class Qualification < ApplicationRecord

  belongs_to :client, class_name: :User, foreign_key: :client_id
  belongs_to :electric, class_name: :User, foreign_key: :electric_id
end
