class Edit < ActiveRecord::Base
  belongs_to :approver, class_name: "User"
  belongs_to :author, class_name: "User"
  belongs_to :article
end
