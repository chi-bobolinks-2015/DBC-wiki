class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      # t.integer :current_edit_id
      
      t.timestamps null: false
    end
  end
end
