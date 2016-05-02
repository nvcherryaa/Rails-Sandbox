class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #render plain: params[:user].inspect
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    session[:current_user_id] = @user.id
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User info successfully updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "User (" + @user.first_name + " " + @user.last_name + ") successfully deleted"
    @user.destroy
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :age)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
