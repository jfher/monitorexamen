# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
main_admin = User.create(:name => 'System', :last_name => 'Admin', 
       :email => 'admin@gmail.com', :password => '12345678', 
       :password_confirmation => '12345678', :role => 'admin').save(:validate => false)

user1 = User.create(:name => 'System', :last_name => 'Admin', 
       :email => 'user1@gmail.com', :password => '12345678', 
       :password_confirmation => '12345678', :role => 'simple').save(:validate => false)

user2 = User.create(:name => 'System', :last_name => 'Admin', 
       :email => 'user2@gmail.com', :password => '12345678', 
       :password_confirmation => '12345678', :role => 'simple').save(:validate => false)

location =  Location.create(:name => 'oficina', :address => 'cala cala, cochabamba', :latitude => '1', :longitude => '1', :user_id => '1')
thermostat = Thermostat.create(:serial => '1', :temperature => '1', :humidity => '1', :energy => '1', :user_id => '1', :location_id => '1')

location2 =  Location.create(:name => 'casa', :address => 'tupuraya, cochabamba', :latitude => '2', :longitude => '2', :user_id => '2')
thermostat2 = Thermostat.create(:serial => '2', :temperature => '2', :humidity => '2', :energy => '2', :user_id => '2', :location_id => '2')

