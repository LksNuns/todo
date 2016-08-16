class CreateFavoriteTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_todos do |t|
      t.references :user, null: false
      t.references :todo_list, null: false
    end
  end
end
