class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user
      if BCrypt::Password.new(@user.password) == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "Hello."
        redirect_to posts_path
      else
        flash[:notice] = "Nope."
        redirect_to login_path
      end
    else
      flash[:notice] = "Nope."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye."
    redirect_to login_path
  end
end