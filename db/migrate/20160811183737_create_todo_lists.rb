class CreateTodoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists do |t|
      t.string :title, null: false
      t.boolean :private, default: false, null: false
    end
  end
end
