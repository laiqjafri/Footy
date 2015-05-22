module Footy
  #   Footy.configure do |config|
  #     config # => instance of Footy::Configuration
  #   end
  #
  # Setting the keys with this Configuration
  #
  #   Footy.configure do |config|
  #     config.api_key  = '2342kjrlkwjelfkjl2342jkljfaadfadf'
  #   end
  #
  class Configuration
    attr_accessor :api_key,
      :api_url

    def initialize #:nodoc:
      @api_key = ENV['FOOTBALL_API_KEY']
      @api_url = "http://football-api.com/api/?"
    end
  end
end
