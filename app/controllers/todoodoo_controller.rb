class TodoodooController < ApplicationController

  def index
    @todos = Todoodoo.where(done: false)
    @completes = Todoodoo.where(done: true)
  end

  def new
    @todoo = Todoodoo.new
  end

  def create
    @todoo = Todoodoo.new(todo_params)

    if @todoo.save
      flash[:notice] = "Your To-Do item was created!"
      redirect_to todoodoo_index_path
    end
  end

  def update
    @todoo = Todoodoo.find(params[:id])

    if @todoo.update_attribute(:done, true)
      redirect_to :action => 'index', :notice => "Your To-Do item was marked as done!"
    else
      redirect_to todoodoo_index_path, :notice => "Your To-Do item was unable to be marked as done!"
    end
  end

  def destroy
    @todoo = Todoodoo.find(params[:id])
    @todoo.destroy

    redirect_to todoodoo_index_path, :notice => "Your To-Do item was deleted!"
  end

  def todo_params
    params.require(:todoodoo).permit(:name, :done)
   end
end
