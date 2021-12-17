class CreateSalles < ActiveRecord::Migration[5.2]
  def change
    create_table :salles do |t|
      t.text :name
      t.boolean :status

      t.timestamps
    end
  end
end
