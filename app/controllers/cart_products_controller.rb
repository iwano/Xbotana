class CartProductsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :non_admin_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  
  def create
    product_id = params[:cart_product][:product_id]
    quantity = params[:cart_product][:quantity]
    price = params[:cart_product][:price]
    subtotal = quantity.to_i * price.to_f
    
    if combine_repeated_products(product_id, quantity, subtotal)
      flash[:success] = "The product has been added to your shopping cart."
      redirect_to cart_path
    else
      @cart_product = current_user.cart_products.build(product_id: product_id, quantity: quantity, subtotal: subtotal)
      if @cart_product.save
        flash[:success] = "The product has been added to your shopping cart."
        redirect_to cart_path
      end
    end
    
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end
  
  def index
    @cart_products = current_user.cart_products
  end
  
  def destroy
    CartProduct.find(params[:id]).destroy
    flash[:warning] = "Item removed"
    
    respond_to do |format|  
      format.html { redirect_to cart_path }  
      format.js   { render :nothing => true }  
    end
  end
  
end