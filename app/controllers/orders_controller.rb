class OrdersController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  
  def create
    number_products = get_products_count
    total = get_order_total
    @order = current_user.orders.build(number_products: number_products, total: total)
    if @order.save
      flash[:success] = "The order has been placed."
      redirect_to root_path
    else
      flash[:failure] = "There was a problem with the database fuck you!."
      redirect_to root_path
    end
  end
  
  def emptycart
    empty_cart
    flash[:warning] = "Cart emptied."
    redirect_to cart_path
  end
end
