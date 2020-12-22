require 'spec_helper'
require 'rubygems'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = ENV['REMOTE_TEST']
  c.configure_rspec_metadata!
end
