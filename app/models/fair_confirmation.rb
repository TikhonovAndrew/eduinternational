class FairConfirmation < ApplicationRecord
  validates :name, :email, :phone, :event, presence: true
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  belongs_to :fair
end