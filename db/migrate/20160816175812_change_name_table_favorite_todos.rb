class ChangeNameTableFavoriteTodos < ActiveRecord::Migration[5.0]
  def change
    rename_table :favorite_todos, :favorite_users_todos
  end
end
