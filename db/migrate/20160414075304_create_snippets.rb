class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :contents
      t.integer :created_by
      t.string :scope
      t.string :tag_trigger

      t.timestamps null: false
    end
  end
end
