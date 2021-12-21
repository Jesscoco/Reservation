class AddCollumnToMaterial < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :salle, foreign_key: true
  end
end
