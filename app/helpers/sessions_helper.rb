module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end
  
  def redirect_back_or(default)
     redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end
    
  private

   def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end
    
    def clear_return_to
      session.delete(:return_to)
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def already_signedin
      if signed_in?
        redirect_to(root_path)
      else
        render 'new'
      end
    end
    
    def non_admin_user
      if current_user.admin?
        redirect_to(root_path)
      end
    end
    
    def get_order_total
      array = current_user.cart_products
      total = 0
      array.length.times do |i|
        total += array[i-1].subtotal
      end
      total
    end 
    
    def get_products_count
      array = current_user.cart_products
      count = 0
      array.length.times do |i|
        count += array[i-1].quantity
      end
      count
    end  
    
    def empty_cart
      current_user.cart_products.destroy_all
      flash[:warning] = "Cart emptied."
     
    end
end
