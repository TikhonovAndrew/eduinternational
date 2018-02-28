class Testimonial < ApplicationRecord
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
  
  has_attached_file :author_photo, styles: { thumb: "340x188#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :author_photo, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_author_photo

  before_save :delete_author_photo, if: ->{ remove_author_photo == '1' && !author_photo_updated_at_changed? }
  def delete_author_photo
    self.author_photo = nil
  end
end
