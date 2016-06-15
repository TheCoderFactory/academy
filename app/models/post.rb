class Post < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader

  extend FriendlyId
    friendly_id :title, use: :slugged

  validates :title, :lead, :content, :published_date, presence: true


  def self.current_articles
    reverse_chron_order.where("published_date <= ?", Date.today)
  end

  # def self.published_in_reverse_chron_order
    # reverse_chron_order.where(publish: true)
  # end

  def self.reverse_chron_order
    published?.order(published_date: :desc)
  end

  def self.published?
    where(publish: true)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |post|
        csv << post.attributes.values_at(*column_names)
      end
    end
  end
end
