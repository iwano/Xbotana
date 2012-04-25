class StaticPagesController < ApplicationController
  def home
    if signed_in? 
      @orders = current_user.orders
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
