class Dashboard::TodoListsController < Dashboard::ApplicationController

  def index
  end

  def new
    @todo_list = TodoList.new
    @task = @todo_list.tasks.build
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    if @todo_list.save
      redirect_to dashboard_todo_lists_path, notice: "Nova Lista de tarefas criada"
    else
      render "new"
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :privacy, tasks_attributes: [:id, :_destroy, :body, :done])
  end

end
