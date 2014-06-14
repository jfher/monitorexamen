require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'json'

agent = Mechanize.new
	a = agent.post('http://localhost:3000/history_thermostats.json',{
			"history_thermostat[temperature]" => 80, 
			"history_thermostat[humidity]" => 10,
			"history_thermostat[energy]" => 10,
			 serial: '1234', #numero serial del termostato
			 mail: 'user1@thermmonitor.com.bo' , pass: 'usuariouno' #usuario y contraseña del dueño del termostato
			})

	puts a.body