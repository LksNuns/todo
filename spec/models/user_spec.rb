require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do

    it { should have_many(:todo_lists).dependent(:destroy) }
    it { should have_many(:favorite_users_todos).dependent(:destroy) }
    it { should have_many(:favorite_todos) }

  end

end
