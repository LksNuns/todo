class Dashboard::TodoListsController < Dashboard::ApplicationController
  before_action :find_todo, only: [ :edit, :update, :destroy ]
  def index
    @todo_lists = current_user.todo_lists
    @todo_list = TodoList.new
  end

  def new
    @todo_list = TodoList.new

    respond_to do |format|
      format.html { redirect_to 'new' }
      format.js { render 'ajax_form' }
    end
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

  def edit
    respond_to do |format|
      format.js { render 'ajax_form' }
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      respond_to do |format|
        format.js {}
      end
    end
  end

  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.js {}
    end
  end


  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :privacy, tasks_attributes: [:id, :_destroy, :body, :done])
  end

  def find_todo
    @todo_list = current_user.todo_lists.find(params[:id])
  end

end
