class AddColumnsToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :priority, :integer
    add_column :todos, :due_date, :Date
    add_column :todos, :is_done, :boolean, :null => false, :default => false
  end
end
