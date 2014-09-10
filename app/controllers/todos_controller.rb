class TodosController < ApplicationController

  def index
    @todos = current_user.todos.where(done: false)
    @completes = current_user.todos.where(done: true)
  end

  def new
    @todo = current_user.todos.new
  end

  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      redirect_to todos_path, :notice => "Task Created"
    else
      render "new"
    end
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def complete
    @todo = current_user.todos.find(params[:id])
    @todo.update_attribute(:done, true)
    redirect_to todos_path, :notice => "Task Complete"
  end

  # def completed
  #   @todos = Task.find(:all, :conditions => "completed_at IS NOT NULL")
  # end

  def update
    @todo = current_user.todos.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path, :notice => "Updated"
    else
      render 'edit'
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    redirect_to todos_path, :notice => "Task Removed"
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :done)
    end

end
