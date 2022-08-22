class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]
    before_action :logged_in_user, only:[:new, :create, :destroy]
    before_action :correct_user,   only: :destroy
    before_action :initialize_session
    before_action :load_cart
    
    def index
        @products = Product.paginate(page: params[:page], per_page: 3)
    end

    def add_to_cart
      id = params[:id].to_i
      session[:cart] << id unless session[:cart].include?(id)
      redirect_to root_path
    end

    def load_cart
      @cart = Product.find(session[:cart])
    end

    def remove_from_cart
      id = params[:id].to_i
      session[:cart].delete(id)
      redirect_to root_path
    end

    def new 
      @product = current_user.products.build if logged_in?
    end

    def show
      @reviews = Review.where(product_id: @product.id).order("created_at DESC")
    end

    def create
        @product = current_user.products.build(product_params)
        @product.image.attach(params[:product][:image])
        if @product.save
          flash[:success] = "Product created!"
          redirect_to current_user
        else
          render 'new', status: :unprocessable_entity
        end
      end

    def edit 
    end

    def update
      if @product.update(product_params)
        flash[:success] = "Product updated"
        redirect_to root_path
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      flash[:success] = "Product deleted"
      if request.referrer.nil?
        redirect_to current_user, status: :see_other
      else
        redirect_to request.referrer, status: :see_other
      end
    end

    private 
        # Use callbacks to share common setup or constraints between actions.
        def set_product
          @product = Product.find(params[:id])
        end
        def product_params
            params.require(:product).permit(:name, :description, :price, :image)
        end

        def correct_user
            @product = current_user.products.find_by(id: params[:id])
            redirect_to root_url, status: :see_other if @product.nil?
        end

        def initialize_session
          session[:cart] ||= []
        end
end
