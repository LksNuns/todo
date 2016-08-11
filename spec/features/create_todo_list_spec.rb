require 'rails_helper'

feature 'create new todo list' do
  scenario 'create a new list with a valid data'do
    visit('/')
    click_on('Nova Lista')

    fill_in('Titulo', with: 'Nova lista')
    check("Privada")
    click_on("Criar Lista")

    expect(page).to have_content('Nova Lista de tarefas criada')
    expect(Todo.last.title).to eq('Nova lista')
  end
end
