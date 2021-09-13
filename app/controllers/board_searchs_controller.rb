class BoardSearchsController < ApplicationController
  
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    searchs = search_for(@model, @content, @method)
    @users = searchs.page(params[:page]).reverse_order

  end

  private

  def search_for(model, content, method)
    
    # 選択したモデルがuserだったら
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
        Board.all
      end

    # 選択したモデルがbookだったら
    elsif model == 'book'
      
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        User.where(name: content)
        
      # 選択した検索方法がが部分一致だったら
      elsif method == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
        
      # 選択した検索方法がが前方一致だったら
      elsif method == "forward_match"
        User.where("name LIKE ?", content+'%')
        
      # 選択した検索方法がが後方一致だったら
      elsif method == "backward_match"
        User.where("name LIKE ?",'%'+content)
  
      else
        User.all
      end
    
    end
  end
    
  
end
