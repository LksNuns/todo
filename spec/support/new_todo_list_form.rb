class NewTodoListForm
  include Capybara::DSL

  def visit_page
    visit('/dashboard/todo_lists/')
    click_on('Nova Lista')
    self
  end

  def fill_in_with(params = {})
    fill_in('Título', with: params.fetch(:title, 'Nova lista'))
    check("Privado")
    self
  end

  def submit
    click_on("Criar Lista")
    self
  end
end
