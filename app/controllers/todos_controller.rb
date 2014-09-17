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
    if !current_user.admin?
      redirect_to todos_path, :notice => "Sorry! You must be an admin to edit :("
    end
  end

  def complete
    set_todo
    @todo.mark_complete!
    redirect_to todos_path, :notice => "Task Complete!"
  end

  def undo
    set_todo
    @todo.undo_complete!
    redirect_to todos_path, :notice => "Task Replaced!"
  end

  def update
    set_todo
    if @todo.update(todo_params)
      redirect_to todos_path, :notice => "Updated!"
    else
      render 'edit'
    end
  end

  def destroy
    set_todo
    @todo.destroy
    redirect_to todos_path, :notice => "Task Removed!"
  end


  def todo_params
    params.require(:todo).permit(:name, :done)
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

end
