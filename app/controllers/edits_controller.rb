class EditsController < ApplicationController

	def index
		@featured_article = Edit.where(featured: true)
		render 'index'
	end

	def new
		@edit = Edit.new
		render 'new'
	end
	
	def update
		@edit = Edit.find_by(id: params[:edit_id])
		@edit.update(approved: true, approver_id: current_user.id)
		redirect_to '/profile'
	end

	def destroy
		@edit = Edit.find_by(id: params[:edit_id])
		@edit.destroy
		redirect_to '/profile'
	end

	def create
		@article = Article.create_with_edit(params[:category_id], 1, params[:edit][:title], params[:edit][:content])
		@category = Category.find(@article.category_id)
		if @article.valid?
			redirect_to category_article_path(@category, @article)
		else
			render 'new'
		end
	end
	
private
	def edit_params
		params.require(:edit).permit(:article_id, :author_id, :approved, :content, :title, :approver_id)
	end
end
