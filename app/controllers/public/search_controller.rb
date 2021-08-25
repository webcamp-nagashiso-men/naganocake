class SearchController < ApplicationController
  def search
    @genres=Genre.all
    @value = params["search"]["value"]
    @word = params["search"]["word"]
    @datas = search_for(@value)
  end

  private

  def search_for(word, value)
    case #引数のhowと一致する処理に進むように定義
    when 'match'#ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます
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
