class AddCollumnToSalles < ActiveRecord::Migration[5.2]
  def change
    add_column :salles, :start_time, :datetime
    add_column :salles, :end_time, :datetime
  end
end
