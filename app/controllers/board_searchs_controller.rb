class BoardSearchsController < ApplicationController
  
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    searchs = search_for(@model, @content, @method)
    @boards = searchs.page(params[:page]).reverse_order
    # byebug

  end

  private

  def search_for(model, content, method)
    
    # 選択したモデルがgenreだったら
    if model == 'genre'
      # 選択した検索方法がが完全一致だったら

      if method == 'perfect'
        Genre.where(name: content)
      # 選択した検索方法がが部分一致だったら

      elsif method == 'partial'
        Genre.where('name LIKE ?', '%'+content+'%')

      elsif method == "forward_match"
        Genre.where("name LIKE ?", content+'%')

      elsif method == "backward_match"
        Genre.where("name LIKE ?",'%'+content)

      else
        Genre.all
      end

    # 選択したモデルがbookだったら
    elsif model == 'board'
      
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        Board.where(title: content)
        
      # 選択した検索方法がが部分一致だったら
      elsif method == 'partial'
        Board.where('title LIKE ?', '%'+content+'%')
        
      # 選択した検索方法がが前方一致だったら
      elsif method == "forward_match"
        Board.where("title LIKE ?", content+'%')
        
      # 選択した検索方法がが後方一致だったら
      elsif method == "backward_match"
        Board.where("title LIKE ?",'%'+content)
  
      else
        Board.all
      end
    
    end
  end
    
  
end
