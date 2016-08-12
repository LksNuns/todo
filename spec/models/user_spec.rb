require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do

    it 'has_many todo_lists' do
      t = User.reflect_on_association(:todo_lists)
      expect(t.macro).to eq :has_many
    end

    it 'when destroy user need to destroy all todo_lists' do
      user = FactoryGirl.create(:user)
      todo_list = FactoryGirl.create(:todo_list, user: user)

      user.destroy

      expect(TodoList.count).to eq 0
    end

  end

end
