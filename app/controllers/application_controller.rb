class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def delete_cart
    empty_cart
  end
end
