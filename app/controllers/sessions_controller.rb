class SessionsController < ApplicationController
	
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])  
      session[:remember_token] = user.id    
      sign_in user
      redirect_back_or user
    else
      flash[:error] = 'Invalid email/password combination' 
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
