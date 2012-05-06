class UserMailer < ActionMailer::Base
  default :from => "calderivan@gmail.com"
 
  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = "https://botanax.herokuapp.com/signin"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "Welcome botanaX")
  end

  def order_processed(route_detail)
    @route_detail = route_detail
    @user = route_detail.order.user
    vendor = route_detail.route.user
    email_with_name = "#{vendor.name} <#{vendor.email}>"
    @url  = "https://botanax.herokuapp.com/routes"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "New order")
  end

  def order_processed_client(route_detail)
    @order_details = route_detail.order.order_details
    @order = route_detail.order
    @user = route_detail.order.user
    email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = "https://botanax.herokuapp.com/orders"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "Your order has been sent")
  end

  def new_order(order)
    @order = order
    email_with_name = "caballeroaguila_22@hotmail.com"
    @url  = "https://botanax.herokuapp.com/routes"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "New Order")
  end

  def new_order_placed(order)
    @order = order
    @order_details = order.order_details
    email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = "https://botanax.herokuapp.com/orders"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "Your new Order")
  end

  def new_route(route)
    @user = route.user
    @route = route
    email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = "https://botanax.herokuapp.com/routes"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "New Route")
  end
end