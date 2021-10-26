class Customers::LikesController < ApplicationController

  def top
     @posts = Post.ranking.take(5)  #page(params[:page]).per(5)
     @genres = Genre.all
  end

  def about
  end

  def create
    post = Post.find(params[:post_id])
    like = current_customer.likes.new(post_id: post.id)
    like.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_customer.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to post_path(post)
  end

end