class RemoveCollunmFromPlannings < ActiveRecord::Migration[5.2]
  def change
    remove_column :plannings, :date, :date
    remove_column :plannings, :beginhour, :time
    remove_column :plannings, :endinghour, :time
  end
end
