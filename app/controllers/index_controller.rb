class IndexController < ApplicationController
  def index
    featured_query = Edit.where(:featured => true)
    @featured = featured_query[0]
  end
end
