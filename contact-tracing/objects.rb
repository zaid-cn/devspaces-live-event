class PersonLocation
    attr_accessor :time
    attr_accessor :person
    attr_accessor :x
    attr_accessor :y

    def initialize(time, person, x, y)
        @time = time.to_i
        @person = person[0]  # We can only display a single character on this map
        if person.length > 1
            puts red "WARN: Truncated person name #{person} to #{@person}"
        end
        @x = x.to_i
        @y = y.to_i
    end
end