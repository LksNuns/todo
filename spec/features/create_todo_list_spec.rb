require 'rails_helper'
require_relative '../support/new_todo_list_form'
require_relative '../support/login_form'

feature 'create new todo list' do
  let(:new_todo_list_form) { NewTodoListForm.new }
  let(:login_form) { LoginForm.new }
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'with a valid data'do
    new_todo_list_form.visit_page.fill_in_with(title: "Nova lista").submit
    expect(page).to have_content('Nova Lista de tarefas criada')
    expect(TodoList.last.title).to eq('Nova lista')
  end

end
