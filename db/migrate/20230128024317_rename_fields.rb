class RenameFields < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :title, :email
    rename_column :posts, :body, :comment
  end
end
