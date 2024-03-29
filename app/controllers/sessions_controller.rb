class SessionsController < ApplicationController
  before_filter :already_signedin, only: :new
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if !session[:mobile_param] || session[:mobile_param] =="0"
        redirect_back_or root_path
      else
        redirect_to root_path
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end 

  def exitsession
  end
end
