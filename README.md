# Blocipedia

Blocipedia is a CRUD Rails application that allows users to create private and public Markdown-based wikis.


## Dependencies
* ruby 2.5.1
* rails 5.2.1
* For ActiveModel validations use [thoughtbot / shoulda ](https://github.com/thoughtbot/shoulda)
* [pundit](https://github.com/varvet/pundit) - simplifies authorization
* [stripe](https://stripe.com/docs/development) - 3rd party e-commerce vendor
* [redcarpet](https://github.com/vmg/redcarpet) - Markdown parser

## Configuration
* Devise used for user authentication
* SENDGRID used for Environment Variables

## Test-Driven-Development
* rspec-rails, '~> 3.0'

## Database
* Use sqlite for testing and development
* Use PostgreSQL for production

## Deployment
* Heroku

## Blocipedia Features
![landing](app/assets/images/landing.png)

* Add new wikis
![new wikis](app/assets/images/new_wikis.png)

* Upgrade to Premium Membership with Stripe
![stripe](app/assets/images/stripe.png)

* Now you can make your wikis private and add collaborators
![premium_member](app/assets/images/premium_member.png)

![collaborators](app/assets/images/collaborators.png)
