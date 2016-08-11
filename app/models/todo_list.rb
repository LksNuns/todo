# == Schema Information
#
# Table name: todo_lists
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  privacy :boolean          default(FALSE), not null
#  user_id :integer
#
# Indexes
#
#  index_todo_lists_on_user_id  (user_id)
#

class TodoList < ApplicationRecord

  belongs_to :user

  validates :title, presence: true


end
