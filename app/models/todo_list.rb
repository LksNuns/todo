# == Schema Information
#
# Table name: todo_lists
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  private :boolean          default(FALSE), not null
#

class TodoList < ApplicationRecord
  validates :title, presence: true
end
