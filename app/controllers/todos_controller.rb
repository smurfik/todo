class TodosController < ApplicationController

  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    @todos = Todo.all
    @todo = Todo.new(permitted_params)
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
    @todo = Todo.find(params[:id])
    @todo.update_attributes(permitted_params)
    redirect_to root_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    redirect_to root_path
  end

end
