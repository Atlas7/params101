My attempt to work throug the Rails Params101 tutorial at [this blog by Daniel P. Clark](http://6ftdan.com/allyourdev/2014/08/01/manual-polymorphic-creation-in-rails/).

# Enviroment

I am on MacOS, Rails 4.x, Ruby 2.2.x.

# Instruction:

Clone this repository

```
git clone https://github.com/Atlas7/params101.git
```

Navigate in the `params101` foler.

Setup the SQLite3 database:

```
rake db:setup
```

Start a local rails server:

```
rails s
```

# Play in Console

Try these in console

```
parameter = {
  "profile": {
    "first_name": "John",
    "last_name": "Smith",
    "socials_attributes": {
      "3": {
        "kind": "linked_in",
        "username": "js123li"
      },
      "2": {
        "kind": "facebook",
        "username": "js123fb"
      } 
    } 
  }
}

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

# Rails 4 workaround query (probably no need in Rails 5)

# These two queries are equivalent (select only the user's facebook account):

@profile.socials.all.where(kind: 2)

@profile.socials.all.where(kind: @profile.socials.kinds.keys.find_index("facebook"))

# These two queries are equivalent (select only the user's facebook and linked_in account):

@profile.socials.all.where(kind: [2, 3])

@profile.socials.all.where(kind: [@profile.socials.kinds.keys.find_index("facebook"), @profile.socials.kinds.keys.find_index("linked_in")])
```
