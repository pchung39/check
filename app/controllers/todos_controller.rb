class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy, :complete, :undo]

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
      redirect_to todos_path, :notice => "Task Created!"
    else
      render "new"
    end
  end

  def edit
    unless current_user.admin? or current_user.vip?
      redirect_to todos_path, :notice => "Oops! Become a VIP to Edit and Remove todos!"
    end
  end

  def complete
    @todo.mark_complete!
    redirect_to todos_path, :notice => "Task Complete!"
  end

  def undo
    @todo.undo_complete!
    redirect_to todos_path, :notice => "Task Replaced!"
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, :notice => "Updated!"
    else
      render 'edit'
    end
  end

  def destroy
    unless current_user.admin? or current_user.vip?
      redirect_to todos_path, :notice => "Oops! Become a VIP to Edit and Remove todos!"
    else
      @todo.destroy
      redirect_to todos_path, :notice => "Task Removed!"
    end
  end

  def todo_params
    params.require(:todo).permit(:name, :done)
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end
