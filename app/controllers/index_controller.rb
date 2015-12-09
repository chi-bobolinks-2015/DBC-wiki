class IndexController < ApplicationController

  def index
    @details = {}
    @details[:featured] = Edit.where(:featured => true).first
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
