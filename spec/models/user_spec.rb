require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do

    it 'has_many todo_lists' do
      t = User.reflect_on_association(:todo_lists)
      expect(t.macro).to eq :has_many
    end

  end

end
