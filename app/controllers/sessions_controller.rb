class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  def create
    user = User.find_by_login_name(params[:login_name])
    if user &&	user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent.signed[:auto_login_token] = user.auto_login_token
      end 
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new
    end
  end
  
  def destroy
  	session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:auto_login_token)    
  	redirect_to [:new, :session]
  end 
  
end
