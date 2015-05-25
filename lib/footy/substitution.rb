module Footy
  class Substitution
    attr_accessor :off_name,
      :off_id,
      :on_name,
      :on_id,
      :minute

    def initialize off_name, off_id, on_name, on_id, minute
      @off_name = off_name
      @off_id   = off_id
      @on_name  = on_name
      @on_id    = on_id
      @minute   = minute
    end
  end
end
