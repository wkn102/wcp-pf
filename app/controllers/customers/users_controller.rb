class Customers::UsersController < ApplicationController

  def show
    @customer = current_customer
    @posts = Post.all
  end

  def edit
    @customer = Customer.find_by(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
   flash[:success] = "投稿内容を変更しました!"
   redirect_to user_path(@customer)
  else
   render :edit
  end
  end

  private

  def customer_params
   params.require(:customer).permit(:email, :name, :encrypted_password, :image, :is_deleted, :nickname, :gender)
  end

end
