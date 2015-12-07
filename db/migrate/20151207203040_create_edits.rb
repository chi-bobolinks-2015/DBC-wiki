class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.integer :article_id
      t.integer :author_id
      t.boolean :queued
      t.string :content
      t.string :title
      t.integer :approved_by_id

      t.timestamps null: false
    end
  end
end
