require 'rails_helper'

RSpec.describe TodoList, type: :model do

  describe 'validations' do

    it 'requires a title' do
      todo_list = TodoList.new(title: "")
      expect(todo_list).to_not be_valid
    end

    it 'requires a privacy' do
      todo_list = TodoList.new(privacy: nil)
      expect(todo_list).to_not be_valid
    end
  end

  describe 'associations' do

    it 'expect that has belong_to user' do
      u = TodoList.reflect_on_association(:user)
      expect(u.macro).to  eq :belongs_to
    end

  end

end
