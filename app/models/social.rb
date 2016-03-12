class Social < ActiveRecord::Base
  enum kind: [ :twitter, :google_plus, :facebook, :linked_in, :skype, :yahoo ]
  #enum kind: {twitter: 0, google_plus: 1, facebook: 2, linked_in: 3, skype: 4, yahoo: 5 }
  belongs_to :sociable, polymorphic: true
  validates_presence_of :kind
  validates_presence_of :username
end
