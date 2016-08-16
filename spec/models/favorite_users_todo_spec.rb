require 'rails_helper'

RSpec.describe FavoriteUsersTodo, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:todo_list) }
  end
  
end
