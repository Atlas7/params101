class Social < ActiveRecord::Base
  enum kind: [ :twitter, :google_plus, :facebook, :linked_in, :skype, :yahoo ]
  belongs_to :sociable, polymorphic: true
  validates_presence_of :kind
  validates_presence_of :username
end