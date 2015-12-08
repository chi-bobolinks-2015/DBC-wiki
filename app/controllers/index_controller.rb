class IndexController < ApplicationController
  def index
    queried_features = Edit.where(:featured => true)
    @featured = Edit.where(:featured => true)[0]
    @first = true
    @last = last_feature?(queried_features)
  end

  def next
    feature_id = (params["current_id"]).to_i
    queried_features = Edit.where(:featured => true)
    @featured = queried_features[feature_id]
    @first = first_feature?
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

  def first_feature?
    if @featured.id == 0
      return true
    else
      return false
    end
  end

end
