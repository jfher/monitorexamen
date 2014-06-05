# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.new({:email => "admin@thermmonitor.com.bo", :password => "usuarioadmin", :password_confirmation => "usuarioadmin" }).save(:validate => false)
User.new({:email => "user1@thermmonitor.com.bo", :password => "usuariouno", :password_confirmation => "usuariouno" }).save(:validate => false)
User.new({:email => "user2@thermmonitor.com.bo", :password => "usuariodos", :password_confirmation => "usuariodos" }).save(:validate => false)
Location.new({:name => "Casa", :address => "Cochabamba, Av. Circunvalacion", :user_id => 2}).save(:validate => true)
Location.new({:name => "Oficina", :address => "Cochabamba, Av. Pando", :user_id => 2}).save(:validate => true)
Location.new({:name => "Ferreteria", :address => "Cochabamba, Av. Libertadores", :user_id => 3}).save(:validate => true)
Location.new({:name => "Carniceria", :address => "Cochabamba, Av. America", :user_id => 3}).save(:validate => true)
Thermostat.new({:serial => "123", :temperature => "30", :user_id => 2, :energy => 10, :location_id => 1}).save(:validate => false)
Thermostat.new({:serial => "1234", :temperature => "50", :user_id => 2, :energy => 20, :location_id => 1}).save(:validate => false)
Thermostat.new({:serial => "12345", :temperature => "40", :user_id => 2, :energy => 30, :location_id => 2}).save(:validate => false)
Thermostat.new({:serial => "123556", :temperature => "10", :user_id => 2, :energy => 40, :location_id => 2}).save(:validate => false)
Thermostat.new({:serial => "0012", :temperature => "30", :user_id => 3, :energy => 10, :location_id => 3}).save(:validate => false)
Thermostat.new({:serial => "00123", :temperature => "50", :user_id => 3, :energy => 20, :location_id => 3}).save(:validate => false)
Thermostat.new({:serial => "001234", :temperature => "40", :user_id => 3, :energy => 30, :location_id => 4}).save(:validate => false)
Thermostat.new({:serial => "0012345", :temperature => "10", :user_id => 3, :energy => 40, :location_id => 4}).save(:validate => false)
