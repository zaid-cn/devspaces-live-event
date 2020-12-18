#!/home/gitpod/.rvm/rubies/ruby-2.6.6/bin/ruby
require 'highline'
require_relative './helpers'
require_relative './objects'

#Time,Person,x,y
INPUT_LOCATIONS_FILE = "locations.csv"

#Time,Person
EXPOSURE_REPORTS_FILE = "exposure.csv"

#TraceId,Time,Person
OUTPUT_FILE = "output.csv"

# Our world is a 10x10 grid
SIZE_OF_WORLD = 10

# Draw an ASCII representation of the 10x10 world
# and the location of each person
def draw_person_map(locations_for_same_time)
    if locations_for_same_time.empty?
        return
    end

    # Create a 2D array and then draw from that array
    array = Array.new(SIZE_OF_WORLD) {Array.new(SIZE_OF_WORLD, " ")}
    locations_for_same_time.each do |location|
        array[location.x][location.y] = location.person
    end

    x = 0
    y = 0
    puts "#{cyan(' 0123456789')}     #{blue('t = ')}#{locations_for_same_time[0].time}"
    (0..9).each do |y|
        puts "#{cyan(y.to_s)}#{array[0][y]}#{array[1][y]}#{array[2][y]}#{array[3][y]}#{array[4][y]}#{array[5][y]}#{array[6][y]}#{array[7][y]}#{array[8][y]}#{array[9][y]}"
    end
    puts " "
end

puts " "

File.readlines(EXPOSURE_REPORTS_FILE).each do |line|
    data_elements = line.split ","
    time = data_elements[0].to_i
    person = data_elements[1].chomp

    puts red "Person #{person} exposed at t = #{time}"
end

puts " "

current_time = 1
current_locations = []
File.readlines(INPUT_LOCATIONS_FILE).each do |line|
    data_elements = line.split ","
    time = data_elements[0].to_i
    person = data_elements[1]
    x = data_elements[2].to_i
    y = data_elements[3].to_i
    person_location = PersonLocation.new(time, person, x, y)

    if time == current_time
        current_locations << person_location
    else
        # The next two lines are for debugging and demo purposes
        draw_person_map(current_locations)
        sleep 2

        current_time = time
        current_locations = []
        current_locations << person_location
    end
end

# Make sure to display the last time series
draw_person_map(current_locations)

puts " "
puts cyan "Exposures were: (Time,Person)"
puts File.read(EXPOSURE_REPORTS_FILE)
puts cyan "The expected results were: (TraceId,Time,Person)"
puts File.read(OUTPUT_FILE)
