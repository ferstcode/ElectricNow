class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.references :user, foreign_key: true
      t.text :detail
      t.integer :calification

      t.timestamps
    end
  end
end
