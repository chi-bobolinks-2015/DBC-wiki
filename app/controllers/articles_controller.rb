class ArticlesController < ApplicationController

# latest version of clicked article
# category_article GET    /categories/:category_id/articles/:id(.:format)      articles#show
	def show
		# category = Category.find(params[:id])
		article = Article.find(params[:id])
		@edit = Edit.where(article_id: article.id, approved: true)
    	render 'show'
	end
end