class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Ecommerce!"
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private 

    def user_params
      params.require(:user).permit(:name, :role, :email, :password,
                                   :password_confirmation)
    end
end
