class Customer < ApplicationRecord


  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 enum gender: { 男性: 1, 女性: 2, その他: 3}

 # 退会機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

has_many :relationships,class_name: "Relationship",  foreign_key: "follower_id",dependent: :destroy
has_many :passive_relationships,class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じて参照→followed_idをフォローしている人
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 【class_name: "Relationship"】は省略可能
has_many :followings, through: :relationships, source: :followed

def follow(customer_id)
    unless self == customer_id
     self.relationships.find_or_create_by(followed_id: customer_id.to_i, follower_id: self.id)
    end
end

def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
end

def following?(customer)
    followings.include?(customer)
end

end


