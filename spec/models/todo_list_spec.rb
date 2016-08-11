require 'rails_helper'

RSpec.describe TodoList, type: :model do

  describe 'validations' do

    let(:user) { FactoryGirl.create(:user) }
    let(:todo_list) { FactoryGirl.create(:todo_list, user: user) }

    it 'with valid params' do
      expect(todo_list).to be_valid
    end

    it 'requires a title' do
      todo_list.title = nil
      expect(todo_list).to_not be_valid
    end

    it 'requires a user' do
      todo_list.user = nil
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
