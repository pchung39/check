class PeopleController < ApplicationController
def new
  @user = People.new
end

def create
  @user = People.new(params[:user])
  if @user.save
    redirect_to todoodoo_index_path, :notice => "Signed Up!"
  else
    render "new"
  end
end
