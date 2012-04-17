class LotsController < ApplicationController
 before_filter :signed_in_user, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]

end