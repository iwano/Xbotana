class OrdersController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :non_vendor, only: [:new, :create, :index, :edit, :update, :destroy]
  
  def create
    number_products = get_products_count
    total = get_order_total
    @order = current_user.orders.build(number_products: number_products, total: total)
    if @order.save
      UserMailer.new_order_placed(@order).deliver
      UserMailer.new_order(@order).deliver
      record_order_details(@order)
      empty_cart
      flash[:success] = "The order has been placed."
      redirect_to orders_path
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
  
  def index
    if current_user.admin? || current_user.hos?
      @orders = Order.all
    else
      @orders = current_user.orders
    end
    
    respond_to do |format|
      format.html #index.html
      format.json {render json: @orders}
      format.xml {render xml: @orders}
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
    respond_to do |format|
      format.html #show.html
      format.json {render json: @order}
      format.xml {render xml: @order}
    end
  end
end
