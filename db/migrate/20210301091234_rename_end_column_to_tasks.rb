class RenameEndColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :end, :end_at
  end
end
