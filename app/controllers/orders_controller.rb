class OrdersController < ApplicationController
  #before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  #before_filter :non_vendor, only: [:new, :create, :index, :edit, :update, :destroy]
  #before_filter :client_only, only: [:checkout]
  before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:new, :create, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:non_vendor) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:checkout]) do |controller|
   controller.send(:client_only) unless controller.request.format.json? || controller.request.format.xml?
  end

  def checkout
    @number_products = get_products_count
    @total = get_order_total
    @cart_products = current_user.cart_products
  end

  def create
    number_products = get_products_count
    total = get_order_total
    @order = current_user.orders.build(number_products: number_products, total: total)
    if @order.save
      record_order_details(@order)
      empty_cart
      flash[:success] = "The order has been placed."
      redirect_to orders_path
    else
      flash[:failure] = "There was a problem with the database we are very sorry :("
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
      format.json {render json: @orders.as_json()}
      format.xml {render xml: @orders.to_xml({:include => { :user => { :only => :name }}, 
          except:[:created_at, :updated_at, :id, :user_id] })}
    end
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
    respond_to do |format|
      format.html #show.html
      format.json {render json: @order_details.as_json()}
      format.xml {render xml: @order_details.to_xml({:include => {:product => {
        :include => { :presentation => {
          :only => :name}, 
          :category => {
            :only => :name},
            :lot => {
              :only => :number
        }}, except:[:created_at, :updated_at, :id, :lot_id, :presentation_id, :category_id, :quantity]}},
        except:[:created_at, :updated_at, :id, :order_id, :product_id] })}
    end
  end
end
