class RenameStartColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :start, :start_at
  end
end
