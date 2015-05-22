require 'net/http'
require 'json'
module Footy
  class Api
    class << self
      private

      def call options={}
        JSON.parse(Net::HTTP.get_response(URI.parse(url(options))).body)
      end

      def url options={}
        options['APIKey'] = Footy.configuration.api_key
        options.inject(Footy.configuration.api_url){|q, o| q += "#{o.first}=#{o.last}&"}
      end
    end
  end
end