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
    
    def hos_user
      redirect_to(root_path) unless current_user.hos?
    end
    
    def vendor_user
      redirect_to(root_path) unless current_user.vendor?
    end
    
    def client_only
      redirect_to(root_path) unless !current_user.vendor? && !current_user.admin? && !current_user.hos?
    end
    
    def non_vendor
      if current_user.vendor?
        redirect_to(root_path)
      end
    end
    
    def hos_vendor_admin_user
      redirect_to(root_path) unless current_user.hos? || current_user.vendor? || current_user.admin?
    end
    
    def already_signedin
      if signed_in?
        redirect_to(root_path)
      else
        render 'new'
      end
    end
    
    def non_admin_user
      if current_user.admin? || current_user.vendor? || current_user.hos?
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
    end
    
    def combine_repeated_products(product_id, quantity, subtotal)
      product = CartProduct.where(:user_id=>current_user.id).where(:product_id=>product_id).first
      if product != nil
        quantity = quantity.to_i + product.quantity
        subtotal = subtotal.to_f + product.subtotal
        product.update_attributes(:quantity => quantity, :subtotal => subtotal)
        return true
      else
        return false
      end
    end
    
    def record_order_details(order)
      products = current_user.cart_products
      products.length.times do |i|
        pr = products[i-1]
        order.order_details.create(product_id: pr.product_id, quantity: pr.quantity, subtotal: pr.subtotal)
        product_to_update = Product.find(pr.product_id)
        product_to_update.update_attributes(:quantity => product_to_update.quantity - pr.quantity)
      end
    end
    
    def get_undelivered_orders(route)
      routes = route.route_details
      route_details = []
      routes.count.times do |i|
        route_details.push(routes[i-1]) unless routes[i-1].order.status != 'on its way'
      end
      route_details
    end
    
    def check_finished_route(id)
      routes = Route.find(id).route_details
      x=true
      routes.count.times do |i|
        x=false unless routes[i].order.status == 'delivered'
      end
      Route.find(id).update_attribute(:finished, true) unless x==false
    end
    
    def get_vendor_orders
      orders=[]
      id = current_user.id
      routes = Route.where(:user_id=>id)
        routes.count.times do |i|
          route_details = routes[i-1].route_details
          route_details.count.times do |j|
            rd = route_details[j-1].order
            orders.push(rd) unless rd.status != 'on its way'
          end
        end
      orders
    end
    
    def get_search_results(key)
      all = []
      results = []
      users = User.find(:all, :conditions => ['name LIKE ?', "%#{key}%"])
      em = User.find(:all, :conditions => ['email LIKE ?', "%#{key}%"])
      emails = check_users_query_exists(users, em)
      products = Product.find(:all, :conditions => ['name LIKE ?', "%#{key}%"])
      states = State.find(:all, :conditions => ['name LIKE ?', "%#{key}%"])
      cities = City.find(:all, :conditions => ['name LIKE ?', "%#{key}%"])
      categories = Category.find(:all, :conditions => ['name LIKE ?', "%#{key}%"])
      presentations = Presentation.find(:all, :conditions => ['name LIKE ?', "%#{key}%"])
      all<<users<<emails<<products<<states<<cities<<categories<<presentations
      all.count.times do |i|
        group = all[i-1]
        group.count.times do |j|
          results << group[j-1]
        end
      end
      results
    end

    def check_users_query_exists(users, emails)
      no_match = []
      emails.count.times do |i|
        record = emails[i-1]
        no_match<<record unless users.include?(record)
      end
      no_match
    end
end
