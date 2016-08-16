class Dashboard::PublicTodosController < Dashboard::ApplicationController

  def index
    @todo_lists = TodoList.all_publics
  end

end
