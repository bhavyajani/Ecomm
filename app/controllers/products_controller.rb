
class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
        @products = Product.all
    end
  
    def create
        @products = Product.new(product_params)
        respond_to do |format| 
            if @products.save 
                format.html { redirect_to @product, notice: 'Product was successfully created.' } 
            else 
                format.html { render :new } 
            end 
        end
    end

    private def product_params
        params.require(:product).permit(:name, :price, :description, :in_stock, :product_category_id)
    end

    def new
        @products = Product.new()
    end
  
    def edit
    end
  
    def show
        @products = Product.find(params[:id])
    end

    def set_product
        @products = Product.find(params[:id])
    end
  
    def update
        respond_to do |format|
            if @products.update(product_params)
                format.html { redirect_to @products, notice: 'Product was successfully updated.' }
            else
                format.html { render :edit } 
            end
        end
    end
  
    def destroy
        @products.destroy
        respond_to do |format|
            format.html { redirect_to products_path, notice: 'Product was deleted.' }
        end
    end
    
end
