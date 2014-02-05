class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.integer :title
      t.integer :summary
      t.text :content

      t.timestamps
    end
  end
end
