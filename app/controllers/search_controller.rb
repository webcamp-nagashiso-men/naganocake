#class SearchController < ApplicationController
  #def search
    #@genres=Genre.all
    #@value = params["search"]["value"]#データを代入
    #@how = params["search"]["how"]#データを代入
    #@datas = search_for(@how, @value)#def search_forを実行(引数に検索ワードと検索方法)
  #end

  #private

  #def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探す
    #Item.where(name: value).or(Item.where(genre_id: value))
  #end

  #def forward
    #Item.where("name LIKE ?", "#{value}%")
  #end

  #def backward(value)
    #Item.where("name LIKE ?", "%#{value}")
  #end

  #def partical(value)
    #Item.where("name LIKE ?", "%#{value}%")
  #end


  #def search_for(how, value)
    #case #引数のhowと一致する処理に進むように定義
    #when 'match'#ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます
      #match(value)
    #when 'forward'
      #forward(value)
    #when 'backward'
      #backward(value)
    #when 'partical'
      #partical(value)
    #end
  #end
#end
