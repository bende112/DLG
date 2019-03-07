require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'
require 'capybara/angular'
require 'rspec/retry'
require 'rest-client'
require 'logger'
require 'json'
require 'net/http/post/multipart'
#require 'test/unit/assertions'
#require 'capybara-screenshot'
#require 'capybara-screenshot/cucumber'

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--start-fullscreen");
  options.add_argument('--incognito')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end


Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_selector = :css
  config.run_server = false
  puts 'Capybara.configure: capybara settings set'
end
Capybara.ignore_hidden_elements = false
Capybara.ignore_hidden_elements = true
Capybara.default_max_wait_time = 5

## Change this to change browser
# Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome


module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)
