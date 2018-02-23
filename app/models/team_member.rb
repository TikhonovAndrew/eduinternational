class TeamMember < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts

  has_attached_file :profile_image, styles: { thumb: "100x100#", medium: "400x400>", slide: '1200x400#' }, default_url: "/images/event/default.png"
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\Z/
  attr_accessor :remove_profile_image

  before_save :delete_profile_image, if: ->{ remove_profile_image == '1' && !profile_image_updated_at_changed? }
  private
    def delete_cover
       self.profile_image = nil
    end
end
