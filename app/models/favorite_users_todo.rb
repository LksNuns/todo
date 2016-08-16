# == Schema Information
#
# Table name: favorite_users_todos
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  todo_list_id :integer          not null
#
# Indexes
#
#  index_favorite_users_todos_on_todo_list_id  (todo_list_id)
#  index_favorite_users_todos_on_user_id       (user_id)
#

class FavoriteUsersTodo < ApplicationRecord

  belongs_to :user
  belongs_to :todo_list

end
