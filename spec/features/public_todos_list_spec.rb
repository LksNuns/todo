require 'rails_helper'

feature 'See allowed todo lists,', feature: true do

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:todo1) { FactoryGirl.create(:todo_list, title: "todo publico", user: user) }
  let(:todo2) { FactoryGirl.create(:todo_list, title: "todo privado", privacy: true, user: user) }

  before do
    login_as(user2, scope: :user)
    user.todo_lists = [todo1, todo2]
  end

  scenario "can see public todos" do
    visit('/')
    click_on('Listas Publicas')
    expect(page).to have_content("todo publico")
  end

  scenario "can't see private todos" do
    visit('/')
    click_on('Listas Publicas')
    expect(page).to_not have_content("todo privado")
  end

  scenario "see todo on change to public" do
    visit('/')
    todo2.update privacy: false
    click_on('Listas Publicas')

    expect(page).to have_content("todo privado")
  end

  scenario "can't see todo on change to private" do
    visit('/')
    todo1.update privacy: true
    click_on('Listas Publicas')

    expect(page).to_not have_content("todo publico")
  end
end
