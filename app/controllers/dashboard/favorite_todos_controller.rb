class Dashboard::FavoriteTodosController < Dashboard::ApplicationController

  before_action :find_params

  def create

    unless @favorite
      @favorite = current_user.favorite_todos.build(todo_list: @todo_list)
    end


    respond_to do |format|
      if @favorite.save
        format.js { render 'toggle_favorite' }
      end
    end

  end

  def destroy
    @favorite = FavoriteTodo.find_by({ user: current_user, todo_list: @todo_list })
    @favorite.destroy
    e = @todo_list.title
    respond_to do |format|
      format.js { render 'toggle_favorite' }
    end

  end

  private

  def find_params
    @todo_list = TodoList.find(params[:id])
  end

end
