module Footy
  class Goal
    attr_accessor :name, :minute, :owngoal, :penalty
    def initialize name, minute, owngoal, penalty
      @name    = name
      @minute  = minute
      @owngoal = owngoal
      @penalty = penalty
    end

    def owngoal?
      owngoal
    end

    def penalty?
      penalty
    end
  end
end
