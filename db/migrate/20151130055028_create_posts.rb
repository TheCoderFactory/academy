class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :lead
      t.string :content
      t.string :image
      t.string :publish
      t.string :published_date

      t.timestamps null: false
    end
  end
end
