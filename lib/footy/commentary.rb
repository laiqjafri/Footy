module Footy
  class Commentary
    attr_accessor :info,
      :localteam_players,
      :visitorteam_players,
      :commentaries,
      :localteam_subs,
      :visitorteam_subs,
      :localteam_substitutions,
      :visitorteam_substitutions

    def initialize
      @match_info                = nil
      @localteam_players         = []
      @visitorteam_players       = []
      @commentaries              = []
      @localteam_subs            = []
      @visitorteam_subs          = []
      @localteam_substitutions   = []
      @visitorteam_substitutions = []
    end

    def set_info data
      match_info = Struct.const_defined?("MatchInfo") ? Struct::MatchInfo : Struct.new("MatchInfo", *data.keys)
      @info = match_info.new *data.values
    end

    def set_localteam data
      if !data["localteam"].nil? and !data["localteam"]["player"].nil?
        data["localteam"]["player"].each do |k, v|
          @localteam_players << Footy::Player.new(v["id"], v["name"], v["number"], v["pos"])
        end
      end
    end

    def set_vistorteam data
      if !data["visitorteam"].nil? and !data["visitorteam"]["player"].nil?
        data["visitorteam"]["player"].each do |k, v|
          @visitorteam_players << Footy::Player.new(v["id"], v["name"], v["number"], v["pos"])
        end
      end
    end

    def set_localteam_subs data
      if !data["localteam"].nil? and !data["localteam"]["player"].nil?
        data["localteam"]["player"].each do |k, v|
          @localteam_subs << Footy::Player.new(v["id"], v["name"], v["number"], v["pos"])
        end
      end
    end

    def set_vistorteam_subs data
      if !data["visitorteam"].nil? and !data["visitorteam"]["player"].nil?
        data["visitorteam"]["player"].each do |k, v|
          @visitorteam_subs << Footy::Player.new(v["id"], v["name"], v["number"], v["pos"])
        end
      end
    end

    def set_commentaries data
      data.each do |comm|
        c = Struct.const_defined?("Commentary") ? Struct::Commentary : Struct.new("Commentary", :id, :isgoal, :comment, :minute)
        @commentaries << c.new(comm["id"], comm["isgoal"] == "True", comm["comment"], comm["minute"])
      end
    end

    def set_localteam_substitutions data
      if !data["localteam"].nil? and !data["localteam"]["substitution"].nil?
        data["localteam"]["substitution"].each do |k, v|
          @localteam_substitutions << Footy::Substitution.new(v["off"], v["off_id"], v["on"], v["on_id"], v["minute"])
        end
      end
    end

    def set_visitorteam_substitutions data
      if !data["visitorteam"].nil? and !data["visitorteam"]["substitution"].nil?
        data["visitorteam"]["substitution"].each do |k, v|
          @visitorteam_substitutions << Footy::Substitution.new(v["off"], v["off_id"], v["on"], v["on_id"], v["minute"])
        end
      end
    end

    class << self
      def parse_from_response response
        commentary = Commentary.new
        commentary.set_info(response["comm_match_info"])                               unless response["comm_match_info"].nil?
        commentary.set_localteam(response["comm_match_teams"])                         unless response["comm_match_teams"].nil?
        commentary.set_vistorteam(response["comm_match_teams"])                        unless response["comm_match_teams"].nil?
        commentary.set_localteam_subs(response["comm_match_subs"])                     unless response["comm_match_subs"].nil?
        commentary.set_vistorteam_subs(response["comm_match_subs"])                    unless response["comm_match_subs"].nil?
        commentary.set_localteam_substitutions(response["comm_match_substitutions"])   unless response["comm_match_substitutions"].nil?
        commentary.set_visitorteam_substitutions(response["comm_match_substitutions"]) unless response["comm_match_substitutions"].nil?

        commentary.set_commentaries(response["comm_commentaries"]["comment"].values) if !response["comm_commentaries"].nil? and !response["comm_commentaries"]["comment"].nil?
        commentary
      end
    end
  end
end
