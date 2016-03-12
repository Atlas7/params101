@profile = Profile.new
@profile.first_name = parameter[:profile][:first_name]
@profile.last_name = parameter[:profile][:last_name]
@profile.socials_attributes = parameter[:profile][:socials_attributes]
@profile.save
@profile = Profile.last
@profile.socials.kinds
@profile.socials.all.where(kind: 2) # => gives you the user facebook account
@profile.socials.all.where(kind: :facebook) # => Apparently only works in Rails 5 or above.

@profile.socials.all.where(kind: [2, 3]) # => gives you the user facebook and linked_in account
@profile.socials.all.where(kind: [:facebook, :linked_in]) # => Apparently only works in Rails 5 or above.

# In Rails 4...

# These two queries are equivalent (select only the user's facebook account):

@profile.socials.all.where(kind: 2)

@profile.socials.all.where(kind: @profile.socials.kinds.keys.find_index("facebook"))

# These two queries are equivalent (select only the user's facebook and linked_in account):

@profile.socials.all.where(kind: [2, 3])

@profile.socials.all.where(kind: [@profile.socials.kinds.keys.find_index("facebook"), @profile.socials.kinds.keys.find_index("linked_in")])