require 'yahoo_weatherman'

puts "What is your postcode?"
postcode = gets.chomp

def location(postcode)
client = Weatherman::Client.new
client.lookup_by_location(postcode)
end

weather = location(postcode)
weather = weather.forecasts

today = Time.now.strftime('%w').to_i

weather.each do |forecasts|

	day = forecasts['date']

	forecastday = day.strftime('%w').to_i

	if forecastday == today
		weatherDay = 'Today'
	elsif forecastday == today + 1
		weatherDay = 'Tomorrow'
	else 
		weatherDay = 'On ' + day.strftime('%A')
	end

	puts weatherDay + ' the weather will be ' + forecasts['text'].downcase + ' with a low of ' + forecasts['low'].to_s + ' and a high of ' + forecasts['high'].to_s + ' degrees celsius.'
end

