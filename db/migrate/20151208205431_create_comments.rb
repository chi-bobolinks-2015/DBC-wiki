class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :article_id, null: false
      t.integer :commenter_id, null: false
    
      t.timestamps null: false
    end
  end
end
