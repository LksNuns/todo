require 'rails_helper'

feature 'create new todo list' do
  scenario 'create a new list with a valid data'do
    visit('/dashboard/todo_lists/')
    click_on('Nova Lista')

    fill_in('Título', with: 'Nova lista')
    check("Privado")
    click_on("Criar Lista")

    expect(page).to have_content('Nova Lista de tarefas criada')
    expect(TodoList.last.title).to eq('Nova lista')
  end
end
