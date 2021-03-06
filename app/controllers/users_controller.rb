class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user ,  only: :destoy
  def index
    @users = User.paginate(page: params[:page], per_page:10)
  end

  def show
    @user = User.find(params[:id])
  
  end

  def new
    @user = User.new
  end

  def destroy
    puts "hello this is the destroy function"
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Welcome to the sample app"
      redirect_to @user
      #same as redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User Updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  

    
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log in"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end

    def admin_user
      redirect_to users_url unless current_user.admin?
    end
end
