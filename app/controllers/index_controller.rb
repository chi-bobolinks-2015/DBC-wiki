class IndexController < ApplicationController
  def index
    @featured = Edit.where(:featured => true)[0]
    session[:feature_id] = 0
  end

  def next
    feature_id =
    @featured = Edit.where(:featured => true)[feature_id]
  end

end
