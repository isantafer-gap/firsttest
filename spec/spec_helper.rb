# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome) 
end

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox) 
end

Capybara.default_driver = :selenium_firefox
Capybara.javascript_driver = :selenium_firefox
Capybara.run_server = false
Capybara.app_host = 'https://www.google.com/'
Capybara.default_max_wait_time = 60

RSpec.configure do |config|
  
  config.include Capybara::DSL, :type => :feature
  require 'rspec/expectations'
  config.include RSpec::Matchers
end
