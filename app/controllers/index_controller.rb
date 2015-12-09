class IndexController < ApplicationController

  def search
    @term = params["search"]
    @user_username_match = User.search("username", @term)
    @category_name_match = Category.search("name", @term)
    @forward_facing = Article.forward_facing_edits
    @article_title_match = @forward_facing.select{ |edit| /#{@term}/.match(edit.title) }
    @article_content_match = @forward_facing.select{ |edit| /#{@term}/.match(edit.title) }
    render 'search_results'
  end

  def landing
    if logged_in?
      redirect_to controller: "index", action: "index"
    else
      redirect_to controller: "sessions", action: "new"
    end
  end

  def index
    @details = {}
    @details[:featured] = Edit.where(:featured => true)[0]
    @details[:first] = true
    @details[:last] = false
    @categories = Category.all.limit(12)
  end


  def next
    @featured = Edit.find((params["current_id"]).to_i)
    @details = @featured.feature_args("next")
    if request.xhr?
      render 'index/_feature', layout: false
    end
  end


  def prev
    @featured = Edit.find((params["current_id"]).to_i)
    @details = @featured.feature_args("prev")
    if request.xhr?
      render 'index/_feature', layout: false
    end
  end

  private

end
