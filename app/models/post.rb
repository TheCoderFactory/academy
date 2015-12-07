class Post < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :title, :lead, :content, :published_date, presence: true

  def self.published_in_reverse_chron_order
    reverse_chron_order.where(publish: true)
  end

  def self.reverse_chron_order
    order(published_date: :desc)
  end
end
