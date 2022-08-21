class ProductsController < ApplicationController
    before_action :logged_in_user, only:[:new, :create, :destroy]
    before_action :correct_user,   only: :destroy
    def index
        @products = Product.paginate(page: params[:page], per_page: 5)
    end

    def new 
      @product = current_user.products.build if logged_in?
    end

    # def show
    # end

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
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:success] = "Product updated"
        redirect_to current_user
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
        def product_params
            params.require(:product).permit(:name, :description, :price, :image)
        end

        def correct_user
            @product = current_user.products.find_by(id: params[:id])
            redirect_to root_url, status: :see_other if @product.nil?
        end
end
