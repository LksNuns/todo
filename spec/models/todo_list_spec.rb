require 'rails_helper'

RSpec.describe TodoList, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:tasks).dependent(:destroy) }
    it { should have_many(:favorite_users_todos).dependent(:destroy) }
    it { should have_many(:follow_users) }
  end

  describe 'with data' do
    let(:user) { FactoryGirl.create(:user) }
    let(:todo_list) { FactoryGirl.create(:todo_list, user: user) }
    let(:todo_list2) { FactoryGirl.create(:private_todo, user: user) }

    it 'all_publics return just publics todos' do
      public_todos = TodoList.all_publics

      expect(public_todos).to include(todo_list)
      expect(public_todos).to_not include(todo_list2)
    end

    it { should validate_presence_of(:title) }
    it { should accept_nested_attributes_for(:tasks) }

  end
end
