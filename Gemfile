source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "image_processing"
gem "sprockets-rails"
gem "mini_magick"
gem "active_storage_validations"
gem "bcrypt"
gem "puma", "~> 5.0"
gem "faker"
gem "will_paginate"
gem "importmap-rails"
gem "bootstrap-will_paginate"
gem "bootstrap-sass"
gem "turbo-rails"
gem "sass-rails"
gem "webpacker"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false


group :development, :test do

  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "mysql2", "~> 0.5.2"

end

group :development do

  gem "guard-bundler", require: false
  gem "rack-mini-profiler"
  gem "web-console"
  gem "listen"
  gem "spring"

end

group :test do

  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rails-controller-testing"
  gem "minitest"
  gem "minitest-reporters"
  gem "guard"
  gem "guard-minitest"
  gem "guard-rspec", require: false

end
