require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'json'

agent = Mechanize.new
	a = agent.post('http://localhost:3000/history_thermostats.json',{
			"history_thermostat[temperature]" => 35, 
			"history_thermostat[humidity]" => 100,
			"history_thermostat[energy]" => 8,
			"history_thermostat[thermostat_id]" => 1,
			 mail: 'luis@yahoo.com' , pass: 'usuariotres'
			})