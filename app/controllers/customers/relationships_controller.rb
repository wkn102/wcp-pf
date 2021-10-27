class Customers::RelationshipsController < ApplicationController
  before_action :authenticate_customer!

  def create
    current_customer.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    customer = Customer.find(params[:user_id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:user_id])
    @customers = customer.followers
  end

end
