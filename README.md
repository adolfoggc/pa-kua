## Table of contents
* [General info](#general-info)
* [Default gems and libraries](#default-gems-and-libraries)
* [Branches and gems](#branches-and-gems)
* [Setup](#setup)
* [Thanks to](#thanks-to)

## General info
This is a simple template for my projects using Ruby on Rails.
	
## Default gems and libraries
Project is created with:
* Ruby 2.7.2
* Rails 6.0.4
* Rspec-rails 5.0.1

## Branches and gems
* Devise 4.7.3

Devise branch contains the devise gem for authentication and uses de model attribute `profile` for different kinds of `member` 
## Setup
You will need to include an yml file for your environmental variables. Create a file on `/config/application.yml`, copy this sample and change the variable default values as you desire 

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