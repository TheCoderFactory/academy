class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :lead, :content, :published_date, presence: true

  has_attached_file :image
  validates_attachment_presence :image, :message => "No image"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.published_in_reverse_chron_order
    reverse_chron_order.where(publish: true)
  end

  def self.reverse_chron_order
    order(published_date: :desc)
  end
end
