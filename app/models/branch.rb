class Branch < ApplicationRecord     
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :socials


  has_attached_file :cover, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_cover

  before_save :delete_cover, if: ->{ remove_cover == '1' && !cover_updated_at_changed? }
  private
    def delete_cover
       self.cover = nil
    end

  has_attached_file :branch_logo, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :branch_logo, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_branch_logo

  before_save :delete_branch_logo, if: ->{ remove_branch_logo == '1' && !branch_logo_updated_at_changed? }
  private
    def delete_branch_logo
       self.branch_logo = nil
    end

  has_attached_file :slider_image, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :slider_image, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_slider_image

  before_save :delete_slider_image, if: ->{ remove_slider_image == '1' && !slider_image_updated_at_changed? }
  private
    def delete_slider_image
       self.slider_image = nil
    end

  has_attached_file :slider_image1, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :slider_image1, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_slider_image1

  before_save :delete_slider_image1, if: ->{ remove_slider_image1 == '1' && !slider_image1_updated_at_changed? }
  private
    def delete_slider_image
       self.slider_image1 = nil
    end
end
