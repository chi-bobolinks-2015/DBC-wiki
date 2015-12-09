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

  def first_feature?
    self == Edit.where(:featured => true).first
  end

  def last_feature?
    self == Edit.where(:featured => true).last
  end

  def feature_args(direction)
    queried_features = Edit.where(:featured => true)
    feature_index = queried_features.rindex(self)
    if direction == "next"
      index_adjuster = 1
    else
      index_adjuster = -1
    end
    featured = queried_features[(feature_index + index_adjuster)]
    first = featured.first_feature?
    last = featured.last_feature?
    return { :featured => featured, :first => first, :last => last }
  end


  # def create_with_edit
  # 	@category = Category.find_or_create_by(:name => name)
  # 	@article = Article.create(:category_id => @category.id, :user_id => current_user.id, :current_edit_id => current_edit_id)
  # 	@edit = Edit.create(:article_id => @article.id, :author_id => current_user.id, :approved => false, :content => content, :title => title, :approver_id => nil, :featured => false )
  # end

  def self.unapproved_edits
    where("approved = false")
  end
end
