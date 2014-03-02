class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :destroy]

  def new
  	@user = User.new
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "User don't found"
      redirect_to root_url
    end
  end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    @user = User.new(user_params)   
    if @user.save
      session[:remember_token] = @user.id
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "User don't found"
      redirect_to root_url
    end
  end

  def update
    begin
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    rescue ActiveRecord::RecordNotFound
      flash.now[:error] = "User don't found"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password,
                                   :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to root_url, notice: "Please sign in."
      end
    end

    def correct_user      
      begin       
        @user = User.find(params[:id])
        unless current_user?(@user)
          flash[:warning] = "You don't have access to this route"
          redirect_to(root_url) 
        end
      rescue ActiveRecord::RecordNotFound
        flash.now[:error] = "User don't found"
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:warning] = "You don't have access to this route"
        redirect_to(root_url) 
      end
    end
end
