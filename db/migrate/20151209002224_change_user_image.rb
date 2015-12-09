class ChangeUserImage < ActiveRecord::Migration
  def change
    remove_column :users, :image_file_name, :string
    remove_column :users, :image_content_type, :string
    remove_column :users, :image_file_size, :integer
    remove_column :users, :image_updated_at, :datetime
    add_column    :users, :image, :string
  end
end
