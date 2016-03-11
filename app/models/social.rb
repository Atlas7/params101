class Social < ActiveRecord::Base
  belongs_to :sociable, polymorphic: true
  enum kind: [ :twitter, :google_plus, :facebook, :linked_in, :skype, :yahoo ]
  validates_presence_of :kind
  validates_presence_of :username
end
