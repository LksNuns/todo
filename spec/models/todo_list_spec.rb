require 'rails_helper'

RSpec.describe TodoList, type: :model do

  describe 'validations' do

    it 'requires title' do
      todo_list = TodoList.new(title: "")
      expect(todo_list.valid?).to be_falsy
    end

    it 'has belong_to user association' do
      u = TodoList.reflect_on_association(:user)
      expect(u.macro).to  eq :belongs_to
    end

  end
end
