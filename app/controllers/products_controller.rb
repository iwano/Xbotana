class ProductsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]
  
 def new
  @product = Product.new
 end

 def create
   @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "The product has been added to the database."
      redirect_to products_path
    else
      render 'new'
    end
 end

 def show
   @product = Product.find(params[:id])
   @cart_product = CartProduct.new
 end

 def index
   @products = Product.paginate(page: params[:page])
 end

 def edit
   @product = Product.find(params[:id])
 end

 def update
   @product = Product.find(params[:id])
   if @product.update_attributes(params[:product])
     flash[:success] = "Product updated"
     redirect_to products_path
   else
     render 'edit'
   end
 end

 def destroy
   Product.find(params[:id]).destroy
   flash[:success] = "The product has been removed from the database."
   redirect_to products_path
 end

end