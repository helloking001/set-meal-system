require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MealSetSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # Convert to Beijing Time when read datetime from ActiveRecord
    config.time_zone = 'Beijing'
    # Save Time as local(Beijing) Time when write datetime into ActiveRecord
    config.active_record.default_timezone = :utc
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
