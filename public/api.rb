require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'json'

agent = Mechanize.new
	a = agent.post('http://localhost:3000/history_thermostats.json',{
			"history_thermostat[temperature]" => 40, 
			"history_thermostat[humidity]" => 20,
			"history_thermostat[energy]" => 20,
			 serial: '444', #numero serial del termostato
			 mail: 'user3@gmail.com' , pass: '13245678' #usuario y contraseña del dueño del termostato
			})