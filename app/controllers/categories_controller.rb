class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :admin_user,     only: [:new, :create, :edit, :update, :destroy]
  
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
    @products = @category.products.paginate(page: params[:page])
    
    respond_to do |format|
       format.html #show.html.erb
       format.json {render json: @category}
     end
  end

  def index
    @categories = Category.paginate(page: params[:page])
    categories = Category.all
    
    respond_to do |format|
       format.html #categories.html.erb
       format.json {render json: categories}
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