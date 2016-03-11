class Profile < ActiveRecord::Base
  has_many :socials, as: :sociable, dependent: :destroy
  accepts_nested_attributes_for :socials, allow_destroy: true
end