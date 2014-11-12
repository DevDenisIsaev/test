class UsersController < ApplicationController

  before_filter :signed_in_user, :admin_user;

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #flash[t(:success, :scope => [:messages, :types])] = t(:create_user_message, :scope => [:messages, :texts])
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #flash[t(:success, :scope => [:messages, :types])] = t :update_user_message, :scope => [:messages, :texts]
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    #flash[t(:success, :scope => [:messages, :types])] = t :delete_user_message, :scope => [:messages, :texts]
    redirect_to users_path(:page => params[:return_page])
  end

end