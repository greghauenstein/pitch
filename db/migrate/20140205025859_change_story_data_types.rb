class ChangeStoryDataTypes < ActiveRecord::Migration
  def change
    change_column :stories, :title, :string
    change_column :stories, :summary, :string
  end
end
