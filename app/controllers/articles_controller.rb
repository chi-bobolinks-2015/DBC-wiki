class ArticlesController < ApplicationController

	def new

	end

	def show
		article = Article.find(params[:id])
		@comments = Comment.where(article_id: params[:id])
		@edit = Edit.where(article_id: article.id, approved: true)
    	render 'show'
	end

end
