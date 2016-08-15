require 'rails_helper'
require_relative '../support/new_todo_list_form'
require_relative '../support/login_form'

feature 'create new todo list with a current_user', feature: true do
  let(:new_todo_list_form) { NewTodoListForm.new }
  let(:login_form) { LoginForm.new }
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  # scenario 'with a valid data', js: true do
  #   new_todo_list_form.visit_page.fill_in_with(title: "Nova lista").submit
  #   expect(page).to have_content('Nova Lista de tarefas criada')
  #   expect(TodoList.last.title).to eq('Nova lista')
  # end

  scenario 'open modal', js: true do
    sleep 2 
    new_todo_list_form.visit_page
    find(:css, "#new_todo_list").to be_visible
  end

end
