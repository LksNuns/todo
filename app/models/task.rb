# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  body         :string
#  done         :boolean          default(FALSE), not null
#  todo_list_id :integer
#
# Indexes
#
#  index_tasks_on_todo_list_id  (todo_list_id)
#
# Foreign Keys
#
#  fk_rails_cdc7813b92  (todo_list_id => todo_lists.id)
#

class Task < ApplicationRecord

  belongs_to :todo_list

  validates :body, presence: true

end
