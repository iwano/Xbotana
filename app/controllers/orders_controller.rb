class OrdersController < ApplicationController
  def new
  end
  
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
  
  def show
  end
  
  def index
  end
  
  def delete_cart
    empty_cart
  end
end
