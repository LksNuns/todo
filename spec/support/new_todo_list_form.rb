class NewTodoListForm
  include Capybara::DSL

  def visit_page
    visit('/dashboard/todo_lists/')
    click_on('Criar uma nova lista')
    self
  end

  def fill_in_with(params = {})
    within("#new_todo_list") do
      click_on("Público")
    end
    self
  end

  def submit
    click_on("Criar Lista")
    self
  end
end
