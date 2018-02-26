class Country < ApplicationRecord        
    extend FriendlyId
    friendly_id :name, use: :slugged

    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end

    has_many :schools
    
    has_attached_file :country_image, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/country/default.png"
    validates_attachment_content_type :country_image, content_type: /\Aimage\/.*\Z/

    attr_accessor :remove_country_image

    before_save :delete_country_image, if: ->{ remove_country_image == '1' && !country_image_updated_at_changed? }
    private
          def delete_country_image
            self.country_image = nil
          end
    scope :with_secondary_schools, -> { joins(:schools).where("schools.category = ? AND selective = ?", "secondary_education", true).distinct }
    scope :with_higher_schools, -> { joins(:schools).where("schools.category = ? AND selective = ?", "higher_education", true).distinct }
end
	        
