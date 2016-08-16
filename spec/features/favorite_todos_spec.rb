require 'rails_helper'

feature 'See favorite todo lists', feature: true do

  let(:user) { FactoryGirl.create(:user) }
  let(:todo1) { FactoryGirl.create(:todo_list, title: "todo publico", user: user) }
  let(:todo2) { FactoryGirl.create(:todo_list, title: "todo privado", privacy: true, user: user) }

  before do
    login_as(user, scope: :user)
    user.todo_lists = [todo1, todo2]
    FavoriteUsersTodo.create(user: user, todo_list: todo1)
  end

  scenario "can see favorite public todo" do
    visit('/')
    click_on('Listas Favoritas')
    expect(page).to have_content("todo publico")
  end

  scenario "can't see favorite private todo" do
    visit('/')
    todo1.update privacy: true

    click_on('Listas Favoritas')
    expect(page).to_not have_content("todo publico")
  end

end
