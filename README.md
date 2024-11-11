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

## UNKNOWN

- rails stimulus_reflex:install
