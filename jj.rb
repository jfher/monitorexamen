require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'json'

agent = Mechanize.new
agent.add_auth('http://localhost:3000/users/sign_in', 'erikita@gmail.com', '12345678')

	aa = agent.put('http://localhost:3000/thermostats/22.json',{
			"thermostat[serial]" => "090909", 
			"thermostat[temperature]" => 11,
			"thermostat[humidity]" => 12, 
			"thermostat[user_id]" => 6 
			})


	puts aa
