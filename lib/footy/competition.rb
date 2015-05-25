module Footy
  class Competition
    attr_accessor :id, :name, :region
    def initialize id, name, region
      @id     = id
      @name   = name
      @region = region
    end

    def fixtures from, to
      response = Footy::Api.call :Action => 'fixtures', :comp_id => self.id, :from_date => from.strftime("%d.%m.%Y"), :to_date => to.strftime("%d.%m.%Y")
      return Footy::Fixture.from_array(response['matches']) if response["ERROR"] == "OK"
    end

    class << self
      def all
        response = Footy::Api.call :Action => 'competitions'
        return from_array(response['Competition']) if response["ERROR"] == "OK"
      end

      def from_array competitions
        competitions.collect{|c| Competition.new(c["id"], c["name"], c["region"]) }
      end
    end
  end
end
