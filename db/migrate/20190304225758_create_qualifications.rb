class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.integer :client_id, foreign_key: true
      t.integer :electric_id, foreign_key: true
      t.text :detail
      t.integer :calification

      t.timestamps
    end
  end
end
