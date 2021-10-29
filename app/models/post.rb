class Post < ApplicationRecord

  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer
  belongs_to :genre
  belongs_to :location

  scope :ranking, -> { left_joins(:likes).group("posts.id").select("posts.*, COUNT(likes.id) AS like_count").order("like_count desc") }

   attachment :image

  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end


end
