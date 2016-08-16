class Dashboard::FavoriteTodosController < Dashboard::ApplicationController

  before_action :find_params, except: [ :index ]

  def index
    @favorite_todos = current_user.favorite_todos.all
  end


  def create

    unless @favorite
      @favorite = current_user.favorite_todos_association.build(todo_list: @todo_list)
    end

    respond_to do |format|
      if @favorite.save
        format.js { render 'toggle_favorite' }
      end
    end

  end

  def destroy
    @favorite = current_user.favorite_todos_association.find_by(todo_list: @todo_list)
    @favorite.destroy
    respond_to do |format|
      format.js { render 'toggle_favorite' }
    end

  end

  private

  def find_params
    @todo_list = TodoList.find(params[:id])
  end

end
