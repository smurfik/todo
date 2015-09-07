class TodosController < ApplicationController

  before_action :ensure_logged_in

  def index
    @todo = Todo.new
    @todos = current_user.todos.all 
  end

  def create
    @todos = current_user.todos.all 
    @todo = current_user.todos.new(permitted_params)
    if @todo.save
      redirect_to root_path 
    else
      render :index
    end
  end

  def permitted_params
    params.require(:todo).permit(:id, :description, :status)
  end

  def update
    @todo = current_user.todos.find(params[:id])
    @todo.update_attributes(permitted_params)
    redirect_to root_path
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.delete
    redirect_to root_path
  end

end
