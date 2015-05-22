require 'footy/configuration'
require 'footy/api'
require 'footy/competition'
require 'footy/team'
require 'footy/fixture'
require 'footy/commentary'

module Footy
  # Gives access to the current Configuration.
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end
end
