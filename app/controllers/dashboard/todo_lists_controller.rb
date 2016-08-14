class Dashboard::TodoListsController < Dashboard::ApplicationController

  def index
    @todo_lists = current_user.todo_lists
    @todo_list = TodoList.new
  end

  def new
    @todo_list = TodoList.new
    @task = @todo_list.tasks.build
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.js {}
        format.html { redirect_to dashboard_todo_lists_path, notice: "Nova Lista de tarefas criada" }
      else
        render "new"
      end
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :privacy, tasks_attributes: [:id, :_destroy, :body, :done])
  end

end
