class Edit < ActiveRecord::Base
  belongs_to :approver, class_name: "User"
  belongs_to :author, class_name: "User"
  belongs_to :article

  validates :article_id, presence: true
  validates :author_id, presence: true
  validates :approved, inclusion: { in: [true, false] }
  validates :content, presence: true, length: { minimum: 5 }
  validates :title, presence: true
  # validates :approver_id, presence: true
  validates :featured, inclusion: { in: [true, false] }

  # def create_with_edit
  # 	@category = Category.find_or_create_by(:name => name)
  # 	@article = Article.create(:category_id => @category.id, :user_id => current_user.id, :current_edit_id => current_edit_id)
  # 	@edit = Edit.create(:article_id => @article.id, :author_id => current_user.id, :approved => false, :content => content, :title => title, :approver_id => nil, :featured => false )
  # end
end
