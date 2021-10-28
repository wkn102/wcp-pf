class Customers::FavoritesController < ApplicationController
 before_action :authenticate_customer!

  def create
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: post.id)
    favorite.save
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to posts_path
  end

  def index
    @posts = Post.page(params[:page]).per(10)
    @customer = Customer.find(params[:customer_id])
    #byebug
  end

end
