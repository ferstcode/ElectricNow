class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :client_id, foreign_key: true
      t.integer :electric_id, foreign_key: true
      t.string :content
      t.references :quatation, foreign_key: true

      t.timestamps
    end
  end
end
