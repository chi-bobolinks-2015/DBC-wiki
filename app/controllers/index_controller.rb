class IndexController < ApplicationController
  def index
    @first = true
    @featured = Edit.where(:featured => true)[0]
    session[:feature_id] = 0
  end

  def next
    feature_id = (params["current_id"]).to_i
    queried_features = Edit.where(:featured => true)
    @featured = queried_features[feature_id]
    p @featured
    @first = first_feature?(queried_features)
    @last = last_feature?(queried_features)
    if request.xhr?
      render 'index/_feature', layout: false
    end
  end

  private

  def last_feature?(queried_array)
    if @featured.id == queried_array.length
      return true
    else
      return false
    end
  end

  def first_feature?(queried_array)
    if @featured.id == 0
      return true
    else
      return false
    end
  end

end
