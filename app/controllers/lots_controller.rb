class LotsController < ApplicationController
 before_filter :signed_in_user, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]

 def new
   @lot = Lot.new
 end
 
 def create
   @lot = Lot.new(params[:lot])
    if @lot.save
      flash[:success] = "The lot has been added to the database."
      redirect_to lots_path
    else
      render 'new'
    end
 end
 
 def show
   @lot = Lot.find(params[:id])
   @products = @lot.products.paginate(page: params[:page])
 end
 
 def index
   @lots = Lot.paginate(page: params[:page])
 end
 
 def destroy
   Lot.find(params[:id]).destroy
   flash[:success] = "The lot has been removed from the database."
   redirect_to lots_path
 end
 
end