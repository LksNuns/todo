class ChangeFieldOnTodoLists < ActiveRecord::Migration[5.0]
  def change
    rename_column :todo_lists, :private, :privacy
  end
end
