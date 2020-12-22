# frozen_string_literal: true

require File.expand_path('../../config/environment', __FILE__)
ENV['RAILS_ENV'] ||= 'test'

# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rails'
require 'rspec/rails'
require 'spec_helper'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
