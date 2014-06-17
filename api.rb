require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'json'

agent = Mechanize.new
	a = agent.post('http://localhost:3000/history_thermostats.json',{
			"history_thermostat[temperature]" => 30,  
			"history_thermostat[humidity]" => 10,
			"history_thermostat[energy]" => 10,
			 serial: '12777', #numero serial del termostato
			 mail: 'user2@thermmonitor.com.bo' , pass: 'usuariodos' #usuario y contraseña del dueño del termostato
			})

	puts a.body
