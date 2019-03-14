class Message < ApplicationRecord
    belongs_to :client, class_name: :User, foreign_key: :client_id, optional: true
    belongs_to :electric, class_name: :User, foreign_key: :electric_id, optional: true
    belongs_to :quatation
end
