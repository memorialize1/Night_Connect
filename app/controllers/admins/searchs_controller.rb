class Admins::SearchsController < ApplicationController
  
  def search
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @content, @methodを代入した、
    # search_forをsearchsに代入
    searchs = search_for(@content, @method)
    @users = searchs.page(params[:page]).reverse_order

  end

  private

  def search_for(content, method)
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
