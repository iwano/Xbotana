class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def update_city_select
      @cities = City.where(:state_id=>params[:id]) unless params[:id].blank?
      render :partial => "cities", :locals => { :cities => @cities}
  end
  
  def new
      @user = User.new
  end
  
  def cities_by_state
    if params[:id].present?
        @cities = State.find(params[:id]).cities
      else
        @cities = []
    end   
    
    respond_to do |format|
      format.js
    end  
  end
   
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html #show.html.erb
      format.json {render json: @user}
      format.xml {render xml: @user}
    end
  end

  def create
    if signed_in?
      flash[:alert] = "You're already loged in"
      redirect_to root_path
     else
       @user = User.new(params[:user])
       if @user.save
         UserMailer.welcome_email(@user).deliver
         sign_in @user
         flash[:success] = "Welcome to Xbotana :)"
         redirect_to @user
       else
         render 'new'
       end
     end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
    
    respond_to do |format|
      format.html #index.html
      format.json {render json: @users}
      format.xml {render xml: @users}
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = "User destroyed."
    redirect_to users_path 
  end

  private
  
      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
      end
end
