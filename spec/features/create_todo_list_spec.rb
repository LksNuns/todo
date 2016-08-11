require 'rails_helper'
require_relative '../support/new_todo_list_form'

feature 'create new todo list' do
  let(:new_todo_list_form) { NewTodoListForm.new }

  scenario 'create a new list with a valid data'do

    new_todo_list_form.visit_page.fill_in_with(title: "Nova lista").submit

    expect(page).to have_content('Nova Lista de tarefas criada')
    expect(TodoList.last.title).to eq('Nova lista')
  end

end
