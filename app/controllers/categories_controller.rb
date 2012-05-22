class CategoriesController < ApplicationController
  #before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  #before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]
  before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:new, :create, :edit, :update, :destroy]) do |controller|
   controller.send(:admin_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "The category has been added to the database."
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    if session[:mobile_param] ==0
      @products = @category.products.paginate(page: params[:page])
    else
      @products = @category.products
    end
    
    respond_to do |format|
       format.html #show.html.erb
       format.json {render json: @category.as_json()}
       format.xml {render xml: @category.to_xml()}
     end
  end

  def index
    categories = Category.all
    if session[:mobile_param] ==0
      @categories = Category.paginate(page: params[:page])
    else
      @categories = categories
    end
    
    respond_to do |format|
       format.html #categories.html.erb
       format.json {render json: categories.as_json()}
       format.xml {render xml: categories.to_xml({only: :name})}
     end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "Category updated"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "The category has been removed from the database."
    redirect_to categories_path
  end
end