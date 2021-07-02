## Table of contents
* [General info](#general-info)
* [Gems and libraries](#gems-and-libraries)
* [Setup](#setup)
* [Thanks to](#thanks-to)

## General info
This is a simple template for my projects using Ruby on Rails.
	
## Gems and libraries
Project is created with:
* Ruby 2.7.2
* Rails 6.0.4
* Rspec-rails 5.0.1
	
## Setup
You will need to include an yml file for your environmental variables. This is the default file

```ruby
default: &default
  app_name: "Your App Name"

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

## Thanks to
* My parents, who raised me and who I love unconditionally
* My friends. They are my rock and my safe heaven 
* [GTi Engenharia Jr.](https://gtijr.com/) who helped me on my first steps on web development
* [Bulldogjob](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project) for this amazing tutorial about writing a good readme