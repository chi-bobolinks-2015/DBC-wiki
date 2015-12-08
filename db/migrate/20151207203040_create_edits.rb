class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.integer :article_id, null: false
      t.integer :author_id, null: false
      t.boolean :approved
      t.string :content, null: false
      t.string :title, null: false, unique: true
      t.integer :approver_id
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
