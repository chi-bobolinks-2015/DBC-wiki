class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.iteger :current_view_id

      t.timestamps null: false
    end
  end
end
