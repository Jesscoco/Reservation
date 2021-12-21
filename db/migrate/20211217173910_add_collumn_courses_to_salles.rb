class AddCollumnCoursesToSalles < ActiveRecord::Migration[5.2]
  def change
    add_column :salles, :courses, :text
    add_reference :salles, :user, foreign_key: true
  end
end
