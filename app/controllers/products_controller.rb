class ProductsController < ApplicationController
  #before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  #before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]
  before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:new, :create, :edit, :update, :destroy]) do |controller|
   controller.send(:admin_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  
 def new
  @product = Product.new
 end

 def create
   @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "The product has been added to the database."
      redirect_to products_path
    else
      render 'new'
    end
 end

 def show
   @product = Product.find(params[:id])
   @cart_product = current_user.cart_products.build
   
   respond_to do |format|
     format.html #show.html.erb
     format.json {render json: @product.as_json()}
     format.xml {render xml: @product.to_xml()}
   end
 end

 def index
   products = Product.all
   if session[:mobile_param] ==0
     @products = Product.paginate(page: params[:page])
   else
    @products = products
   end
   respond_to do |format|
     format.html #products.html.erb
     format.json {render json: products.as_json()}
     format.xml {render xml: products.to_xml({:include => { :category => { :only => :name }, 
          :presentation => { :only => :name},
          :lot => { :only => :number}}, 
          except:[:created_at, :updated_at, :id, :category_id, :lot_id, :presentation_id] })}
   end
 end

 def edit
   @product = Product.find(params[:id])
 end

 def update
   @product = Product.find(params[:id])
   if @product.update_attributes(params[:product])
     flash[:success] = "Product updated"
     redirect_to products_path
   else
     render 'edit'
   end
 end

 def destroy
   Product.find(params[:id]).destroy
   flash[:success] = "The product has been removed from the database."
   redirect_to products_path
 end

end