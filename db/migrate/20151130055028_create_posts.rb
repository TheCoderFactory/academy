class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :lead
      t.text :content
      t.attachment :image
      t.boolean :publish
      t.date   :published_date

      t.timestamps null: false
    end
  end
end
