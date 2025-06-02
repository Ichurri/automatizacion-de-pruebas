begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'selenium-webdriver'  # <--- Esta línea es crucial

# PTravel Settings
ENV['USER'] = "Pepazo"
ENV['PSW'] = "ILoveQA"

# Configuraciones generales
Capybara.default_max_wait_time = 15
Capybara.app_host = "https://cba.ucb.edu.bo/"
Capybara.run_server = false

# Clase para registrar drivers
class CapybaraDriverRegistrar
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      if browser == :chrome
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('--incognito')
        options.add_argument('--disable-infobars')
        options.add_argument('--disable-extensions')
        options.add_argument('--disable-notifications')
        options.add_argument('--disable-popup-blocking')
        options.add_argument('--disable-save-password-bubble')
        options.add_argument('--no-default-browser-check')
        options.add_argument('--disable-translate')
        options.add_argument('--start-maximized')

        prefs = {
          'credentials_enable_service' => false,
          'profile.password_manager_enabled' => false
        }
        options.add_preference(:prefs, prefs)

        Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
      else
        Capybara::Selenium::Driver.new(app, browser: browser)
      end
    end
  end
end

# Registrar el driver de Chrome en modo incógnito
CapybaraDriverRegistrar.register_selenium_driver(:chrome)
Capybara.default_driver = :selenium
