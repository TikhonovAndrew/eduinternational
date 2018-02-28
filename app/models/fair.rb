class Fair < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :branch
  has_many :fair_confirmations

  has_attached_file :cover, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_cover

  before_save :delete_cover, if: ->{ remove_cover == '1' && !cover_updated_at_changed? }
  private
    def delete_cover
       self.cover = nil
    end

  has_attached_file :fair_image, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :fair_image, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_fair_image

  before_save :delete_fair_image, if: ->{ remove_fair_image == '1' && !fair_image_updated_at_changed? }
  private
    def delete_event_image
       self.fair_image = nil
    end

  def name_time
     "#{self.name} - #{self.fair_date_time.strftime("%m-%d-%Y")}"
  end
end

