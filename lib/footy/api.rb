require 'net/http'
require 'json'
module Footy
  class Api
    class << self
      def call options={}
        response = JSON.parse(Net::HTTP.get_response(URI.parse(url(options))).body)
        raise Footy::FootyError, response["ERROR"] unless response["ERROR"] == "OK"
        response
      end

      private
      def url options={}
        options['APIKey'] = Footy.configuration.api_key
        options.inject(Footy.configuration.api_url){|q, o| q += "#{o.first}=#{o.last}&"}
      end
    end
  end
end
