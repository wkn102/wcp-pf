class Post < ApplicationRecord

  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :genre

   attachment :image

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
