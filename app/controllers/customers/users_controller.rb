class Customers::UsersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(10)
    @customer = current_customer
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(4)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
   flash[:success] = "内容を変更しました!"
   redirect_to user_path(@customer)
  else
   render :edit
  end
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
   params.require(:customer).permit(:email, :name, :encrypted_password, :image, :is_deleted, :nickname, :gender)
  end
 end





