class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :cover, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_cover

  before_save :delete_cover, if: ->{ remove_cover == '1' && !cover_updated_at_changed? }
  private
    def delete_cover
       self.cover = nil
    end

  has_attached_file :event_image, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :event_image, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_event_image

  before_save :delete_event_image, if: ->{ remove_event_image == '1' && !event_image_updated_at_changed? }
  private
    def delete_event_image
       self.event_image = nil
    end

  has_attached_file :event_image1, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :event_image1, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_event_image1

  before_save :delete_event_image1, if: ->{ remove_event_image1 == '1' && !event_image1_updated_at_changed? }
  private
    def delete_event_image1
       self.event_image1 = nil
    end


  def name_time
     "#{self.name} - #{self.event_date_time.strftime("%m-%d-%Y")}"
  end
end
