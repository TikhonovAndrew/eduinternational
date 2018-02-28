class Post < ApplicationRecord
  validates :name, :title, :body, presence: true
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  belongs_to :branch
  
  has_attached_file :cover, styles: { thumb: "340x188#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  
  attr_accessor :remove_cover

  before_save :delete_cover, if: ->{ remove_cover == '1' && !cover_updated_at_changed? }
  def delete_cover
    self.cover = nil
  end
  
  has_attached_file :post_image, styles: { thumb: "340x188#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_post_image

  before_save :delete_post_image, if: ->{ remove_post_image == '1' && !post_image_updated_at_changed? }
  def delete_post_image
    self.post_image = nil
  end
end
