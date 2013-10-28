class SessionsController < ApplicationController
  require 'bcrypt'
  skip_before_filter :authenticate_user
  
  def new
  end
    
  def create
    if authenticated?
      session[:logged] = 1
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Bem-vindo, #{@user.name}!"
    else
      render action: 'new', notice: 'Nome de usuário ou senha inválidos.'
    end  
  end  
  
  def destroy  
    session[:logged] = nil
    redirect_to login_path, notice: 'Você saiu.'
  end

  private

    def authenticated?
      user, password = params[:nickname], params[:password]
      @user = User.find_by_nickname(user)
      @user && @user.authenticate(password)
    end

end