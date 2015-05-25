module Footy
  class Fixture
    attr_accessor :id, :date, :time, :status, :localteam, :visitorteam
    def initialize id, date, time, status, localteam_id, localteam_name, visitorteam_id, visitorteam_name
      @id          = id
      @date        = date
      @time        = time
      @status      = status
      @localteam   = Footy::Team.new localteam_id, localteam_name
      @visitorteam = Footy::Team.new visitorteam_id, visitorteam_name
    end

    def commentary
      response = Footy::Api.call :Action => 'commentaries', :match_id => self.id
      Footy::Commentary.parse_from_response(response["commentaries"].first) if response["ERROR"] == "OK"
    end

    class << self
      def from_array fixtures
        fixtures.collect{ |f| Footy::Fixture.new f['match_id'], f['match_formatted_date'], f['match_time'], f['match_status'], f['match_localteam_id'], f['match_localteam_name'], f['match_visitorteam_id'], f['match_visitorteam_name'] }
      end
    end
  end
end
