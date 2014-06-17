require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'json'

agent = Mechanize.new
	a = agent.post('http://localhost:3000/history_thermostats.json',{
			"history_thermostat[temperature]" => 40,  
			"history_thermostat[humidity]" => 10,
			"history_thermostat[energy]" => 10,
			 day: 'Monday', 
			 time: '12:00 pm a 6:00 pm',
			 serial: '123', #numero serial del termostato
			 mail: 'user1@thermmonitor.com.bo' , pass: 'usuariouno' #usuario y contraseña del dueño del termostato
			})

	puts a.body
