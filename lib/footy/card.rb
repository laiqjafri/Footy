module Footy
  class Card
    attr_accessor :name, :minute, :type
    def initialize name, minute, type
      @name   = name
      @minute = minute
      @type   = type
    end
  end
end
