class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :post
  belongs_to :genre
  belongs_to :location

end
