class CreatePlannings < ActiveRecord::Migration[5.2]
  def change
    create_table :plannings do |t|
      t.time :beginhour
      t.time :endinghour
      t.text :courses
      t.date :date

      t.timestamps
    end
  end
end
