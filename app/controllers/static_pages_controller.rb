class StaticPagesController < ApplicationController
  def home
    if signed_in? 
      @orders = current_user.orders
      @static_pages = Order.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
