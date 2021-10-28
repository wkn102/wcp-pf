class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def top
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
   flash[:success] = "内容を変更しました!"
   redirect_to admins_user_path(@customer)
  else
   render :edit
  end
  end

  private

  def customer_params
   params.require(:customer).permit(:email, :name, :encrypted_password, :image, :is_deleted, :nickname, :gender)
  end

end

