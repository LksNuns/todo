class Dashboard::TodoListsController < Dashboard::ApplicationController

  def index
  end

  def new
    @todoList = TodoList.new
  end

  def create
    @todoList = current_user.todo_lists.build(todo_list_params)

    if @todoList.save
      redirect_to dashboard_todo_lists_path, notice: "Nova Lista de tarefas criada"
    else
      render "new"
    end
  end


  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :private)
  end

end
