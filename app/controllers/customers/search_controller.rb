class Customers::SearchController < ApplicationController

  def search
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def location(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    target_location_id = Location.find_by(name: value)&.id
    Post.where(location_id: target_location_id)
  end

  def customer(value)
    target_customer_id = Customer.find_by(nickname: value)&.id
    Post.where(customer_id: target_customer_id)
  end

  def genre(value)
    target_genre_id = Genre.find_by(name: value)&.id
    Post.where(genre_id: target_genre_id)
  end

  def post(value)
    Post.where("name LIKE ?", "#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'location'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      location(value)
    when 'customer'
      customer(value)
    when 'genre'
      genre(value)
    when 'post'
      post(value)
    end
  end

end
