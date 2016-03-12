@profile = Profile.new
@profile.first_name = parameter[:profile][:first_name]
@profile.last_name = parameter[:profile][:last_name]
@profile.socials_attributes = parameter[:profile][:socials_attributes]
@profile.save
@profile = Profile.last
@profile.socials.kinds
@profile.socials.all.where(kind: 2) # => gives you the user facebook account
@profile.socials.all.where(kind: :facebook) # => gives you nothing. Why? Apparently only works in Rails or above.