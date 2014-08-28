class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller => "todoodoo" , :action => "index"
    end
  end

  def home
    @todos = Todoodoo.where(done: false)
    @completes = Todoodoo.where(done: true)
  end
end
