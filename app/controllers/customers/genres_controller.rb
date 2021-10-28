class Customers::GenresController < ApplicationController
  before_action :authenticate_customer!

  def index
    @posts = Post.page(params[:page]).per(10)
  end
end
