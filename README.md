# README

### Rake Tasks
As Heroku has a size limit to the media we can upload, not all of the Dota Heroes images are in develop. Hence. please add the missing hero images to your current branch before running the rake task and remove those changes.

rake images_upload:dota_heroes

rake images_upload:dota_items

If you wish to replace existing images on production, please delete those files from AWS before running the heroku rake commands.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
