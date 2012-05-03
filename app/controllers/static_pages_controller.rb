class StaticPagesController < ApplicationController
  def search
    if params[:search]
      @results = get_search_results(params[:search])
      
    else
      @users = User.find(:all)
    end
    @searchkey = params[:search]
  end
  
  def home
    if signed_in? 
      if current_user.admin?
        @static_pages = Order.paginate(page: params[:page])
      elsif current_user.hos?
        @orders = Order.where(:status=>"processing") 
      elsif current_user.vendor?
        @orders = get_vendor_orders
      else
        @orders = current_user.orders
      end
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
