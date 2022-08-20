class UsersController < ApplicationController
 
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @products = @user.products.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private 

    def user_params
      params.require(:user).permit(:name, :role, :email, :password,
                                   :password_confirmation)
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url), status: :see_other unless current_user?(@user)
    end

    # Confirms a seller user
    def seller_user
      redirect_to(root_url), status: :see_other unless current_user.role?
    end
end
