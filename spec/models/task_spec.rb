require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'associations' do

    it 'has one TodoList' do
      u = Task.reflect_on_association(:todo_list)
      expect(u.macro).to  eq :belongs_to
    end

  end
end
