module Footy
  class Player
    attr_accessor :id, :name, :number, :pos

    def initialize id, name, number, pos
      @id     = id
      @name   = name
      @number = number
      @pos    = pos
    end
  end
end
