class ChangePostImage < ActiveRecord::Migration
  def change
    remove_column :posts, :image_file_name, :string
    remove_column :posts, :image_content_type, :string
    remove_column :posts, :image_file_size, :integer
    remove_column :posts, :image_updated_at, :datetime
    add_column    :posts, :image, :string
  end
end
