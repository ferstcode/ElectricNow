class CreateDetections < ActiveRecord::Migration[5.2]
  def change
    create_table :detections do |t|
      t.references :user, foreign_key: true
      t.text :detail
      t.string :image
      t.string :address
      t.string :commune
      t.date :date
      t.time :hour
      t.integer :state_mode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
