class ArticlesController < ApplicationController

# latest version of clicked article
	def show
		article = Article.find(params[:id])
		@edit = Edit.where(article_id: article.id, approved: true)
    	render 'show'
	end
end