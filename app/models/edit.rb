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
    self == Edit.where(:featured => true)[0]
  end

  def last_feature?
    featured_articles = Edit.where(:featured => true)
    featured_index = featured_articles.length - 1
    self == Edit.where(:featured => true)[featured_index]
  end

  def feature_args(direction)
    queried_features = Edit.where(:featured => true)
    feature_index = queried_features.rindex(self)
    if direction == "next"
      index_adjuster = 1
    else
      index_adjuster = -1
    end
    new_featured = queried_features[(feature_index + index_adjuster)]
    first = new_featured.first_feature?
    last = new_featured.last_feature?
    return { :featured => new_featured, :first => first, :last => last }
  end

  def self.unapproved_edits
    where("approved = false")
  end
end
