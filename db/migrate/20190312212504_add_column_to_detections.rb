class AddColumnToDetections < ActiveRecord::Migration[5.2]
  def change
    add_column :detections, :electric_id, :integer
  end
end
