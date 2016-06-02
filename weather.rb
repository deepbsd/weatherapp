#!/usr/bin/env ruby

# this is the final app for Skillcrush 104.  It's a weather app used
# to snag the forecast from a user-selected location

require 'barometer'


def get_weather(where)
    barometer = Barometer.new(where)
    weather = barometer.measure

    # today variable below used in forecast loop in if statement
    today = Time.now.strftime("%d").to_i
    tomorrow = today+1

    # Print today's weather
    puts "Today's weather is " + weather.today.icon + " with high of " + weather.today.high.f.to_s + " and a low of " + weather.today.low.f.to_s

    # Print rest of forecast...
    weather.forecast.each do |forecast|
        day = forecast.starts_at.day
	      if day == today
	          day_name = 'Today'
	      else
	          day_name = forecast.starts_at.strftime('%A')
            puts day_name + " will be " + forecast.icon + " with low of " + forecast.low.f.to_s + " and a high of " + forecast.high.f.to_s
	      end   # if statement
     end   # for loop

end     # get_weather method


# Get location from user
puts "What area or zipcode are you interested in?"
where = gets.chomp
get_weather(where)
