class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.integer :article_id
      t.integer :author_id
      t.boolean :approved
      t.string :content
      t.string :title
      t.integer :approver_id

      t.timestamps null: false
    end
  end
end
