# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

### STEPS

- rails new spotify-rails -d postgresql -c tailwind

## Add this into Gemfile

- gem 'dotenv-rails', groups: [:development, :test]

## Generate Controller with Index Action

- rails g controller home index

## Generate Manual Model

- rails g model song title image:attachment audio_file: attachment artist:belongs_to

## Active Storage to Use Files

- rails active_storage:install

## Generate Record Session (Device) to Sing In-Out

- rails g devise:install
- rails g tailwind_devise:views
- rails g device User|Artist|user|artist
- rails db:migrate

## Generate Stimulus Controller

- rails g stimulus controller_name

## Generate CRUD with relation

- rails g scaffold song title image:attachment audio_file: attachment artist:belongs_to

## ROLLBACK DB (REVERT)

- rails db:rollback

## Generate Migration

- rails g migration add_stage_name_to_artist

## ADD @rails/request.js

- bin/importmap pin @rails/request.js

## ADD Stripe

- bundle add stripe
- bin/importmap pin @stripe/connect-js

## ADD/Edit Credentials (Environment)

- EDITOR=vi rails credentials:edit --environment=development
- ctrl + c
- :wq!

```yml
# aws:
#   access_key_id: {{aws.access_key}}
#   secret_access_key: {{aws.secret_key}}
stripe:
  pk: { { stripe.access_key } }
  sk: { { stripe.secret_key } }
  connect_client_id: { { stripe.connect_client_id } }
```

## Create Initializer/stripe.rb

- Stripe.api_key = Rails.application.credentials.dig(:stripe, :sk)

## Update Artist Model

- after_create_commit :create_stripe_account

```Ruby
def create_stripe_account
  stripe_account = Stripe::Account.create()
  update(stripe_account_id: stripe_account.id)
end
```

## Update All Artist Record

- Artist.find_each(&:create_stripe_account)

## UNKNOWN

- rails stimulus_reflex:install
