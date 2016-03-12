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
@profile.Profile.last
@profile.socials.kinds
@profile.socials.all.where(kind: 2) # => gives you the user facebook account
@profile.socials.all.where(kind: :facebook) # => gives you nothing. Why?
```
