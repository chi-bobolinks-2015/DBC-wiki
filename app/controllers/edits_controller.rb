class EditsController < ApplicationController

	def index
		@featured_article = Edit.where(featured: true)
		render 'index'
	end

	def new
		@edit = Edit.new
		render 'new'
	end

	# def create
	# 	@category = Category.find_or_create_by(:name => name)
	# 	@article = Article.create(:category_id => @category.id, :user_id => current_user.id, :current_edit_id => current_edit_id)
	# 	@edit = Edit.create(:article_id => @article.id, :author_id => current_user.id, :approved => false, :content => content, :title => title, :approver_id => nil, :featured => false )
  		
 #  		if @edit.valid?
 #  			redirect_to @edit
 #  		else
 #    		render 'new'
 #    	end
	# end
	
# private
# 	def article_params
# 		params.require(:article).permit(:category_id, :user_id)
# 	end

# 	def edit_params
# 		params.require(:edit).permit(:article_id, :author_id, :approved, :content, :title, :approver_id)
# 	end
end
