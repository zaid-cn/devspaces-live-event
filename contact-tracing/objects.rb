class PersonLocation
    attr_accessor :time
    attr_accessor :person
    attr_accessor :x
    attr_accessor :y
    attr_accessor :x_direction
    attr_accessor :y_direction

    def initialize(time, person, x, y)
        @time = time.to_i
        @person = person[0]  # We can only display a single character on this map
        if person.length > 1
            puts red "WARN: Truncated person name #{person} to #{@person}"
        end
        @x = x.to_i
        @y = y.to_i
        @x_direction = rand(3) - 1
        @y_direction = rand(3) - 1
    end

    def to_csv
        "#{@time},#{@person},#{@x},#{@y}"
    end

    ################################################################
    # I used the method below to generate the input location data  #
    # You may or may not find it useful                            #
    ################################################################
    def increment_time
        @time = @time + 1
    end

end