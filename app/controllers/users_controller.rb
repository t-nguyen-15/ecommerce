class UsersController < ApplicationController
 
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @product = current_user.products.build
    @products = @user.products.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Ecommerce"
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else 
      render 'edit', status: :unprocessable_entity
    end
  end

  private 

    def user_params
      params.require(:user).permit(:name, :role, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end

    # Confirms a seller user.
    def seller_user
      redirect_to(root_url, status: :see_other) unless current_user.role?
    end
end
