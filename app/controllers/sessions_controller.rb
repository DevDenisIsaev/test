class SessionsController < ApplicationController
  def new
    if admin_user?
      redirect_to users_path
    end
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to data_path
    else
      #flash[:error] = 'Неверный имя пользователя или пароль'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
