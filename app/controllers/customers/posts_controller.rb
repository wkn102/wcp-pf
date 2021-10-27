class Customers::PostsController < ApplicationController

 def index
  @posts = Post.page(params[:page]).per(6)
 end

 def new
  @post = Post.new
  @customer = Customer.new
 end

 def create
  @post = Post.new(post_params)
  @post.customer_id = current_customer.id
  if @post.save
   flash[:success] = "投稿しました!"
   redirect_to post_path(@post.id)
  else
   render :new
  end
 end

 def show
  @post = Post.find(params[:id])
  @customer = @post.customer
 end

 def edit
  @post = Post.find(params[:id])
 end

 def update
   @post = Post.find(params[:id])
  if @post.update(post_params)
   flash[:success] = "投稿内容を変更しました!"
   redirect_to post_path(@post)
  else
   render :edit
  end
 end

 def destroy
  @post = Post.find_by(id: params[:id])
  @post.destroy
  redirect_to posts_path
 end

 private

  def post_params
   params.require(:post).permit(:image, :name, :customer_id, :genre_id, :location_id, :statement, :evaluation, :address)
  end

 end
