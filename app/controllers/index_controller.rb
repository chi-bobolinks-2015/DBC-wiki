class IndexController < ApplicationController
  def index
    @featured = Edit.where(:featured => true)
  end
end
