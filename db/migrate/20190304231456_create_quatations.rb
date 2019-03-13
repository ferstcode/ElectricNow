class CreateQuatations < ActiveRecord::Migration[5.2]
  def change
    create_table :quatations do |t|
      t.references :user, foreign_key: true
      t.references :detection, foreign_key: true
      t.text :detail
      t.integer :amount
      t.date :date
      t.time :hour
      t.integer :state_mode, default: 2

      t.timestamps
    end
  end
end
