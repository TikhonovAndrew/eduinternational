class School < ApplicationRecord
  extend FriendlyId
    friendly_id :name, use: :slugged
    validates :name, :about, :country_id, presence: true

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  has_attached_file :cover, styles: { thumb: "100x100#", medium: "400x400>", large: '800x800>', slide: '1200x500#' }, default_url: "/images/school/default.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_cover

  before_save :delete_cover, if: ->{ remove_cover == '1' && !cover_updated_at_changed? }
  private
  def delete_cover
    self.cover = nil
  end

  has_attached_file :school_image, styles: { thumb: "100x100#", medium: "400x400>", large: '800x800>', slide: '1200x500#' }, default_url: "/images/school/default.png"
  validates_attachment_content_type :school_image, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_school_image

  before_save :delete_school_image, if: ->{ remove_school_image == '1' && !school_image_updated_at_changed? }
  private
  def delete_school_image
    self.school_image = nil
  end
  
  belongs_to :country
  has_many :programs
  accepts_nested_attributes_for :programs, reject_if: :all_blank, allow_destroy: true

  

  scope :higher_education, -> { where(:category => 'higher_education') }
  scope :secondary_education, -> { where(:category => 'secondary_education') }
end
