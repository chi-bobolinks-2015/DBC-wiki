class ArticlesController < ApplicationController

	def index
	end

	def new
		@category = Category.find(params[:category_id])
		@edit = Edit.new
	end

	def show
		@article = Article.find(params[:id])
		@category = Category.find(@article.category_id)
		@comments = Comment.where(article_id: params[:id])
    	render 'show'
	end

	def destroy
		@article = Article.find(params[:id])
		@category = Category.find(@article.category_id)
		@article.destroy

		redirect_to categories_path(@category)
	end

end
