class CreateRuts < ActiveRecord::Migration[5.2]
  def change
    create_table :ruts do |t|
      t.string :rut

      t.timestamps
    end
  end
end
