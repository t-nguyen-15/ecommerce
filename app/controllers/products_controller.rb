class ProductsController < ApplicationController
    before_action :logged_in_user, only:[:index, :show, :edit, :create, :update, :destroy]
    def index
        @products = Product.paginate(page: params[:page])
    end

    def show
    end

    def edit 
    end

    def create
    end

    def update
    end

    def destroy
    end
end
