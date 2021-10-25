class Customers::SearchController < ApplicationController

  def search
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    target_location_id = Location.find_by(name: value)&.id
    Post.where(location_id: target_location_id)
  end

  def forward(value)
    Customer.where("nickname LIKE ?", "#{value}%")
  end

  def partical(value)
    Post.where("name LIKE ?", "#{value}%")
  end

  def backward(value)
    Genre.where("name LIKE ?", "#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end

end
