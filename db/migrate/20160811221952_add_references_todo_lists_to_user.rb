class AddReferencesTodoListsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :todo_lists, :user
  end
end
