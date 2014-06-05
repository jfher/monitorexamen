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
user1 = User.create(:id => '33',:name => 'System', :last_name => 'Admin', 
       :email => 'user1@gmail.com', :password => '12345678', 
       :password_confirmation => '12345678', :role => 'simple').save(:validate => false)
user2 = User.create(:name => 'System', :last_name => 'Admin', 
       :email => 'user2@gmail.com', :password => '12345678', 
       :password_confirmation => '12345678', :role => 'simple').save(:validate => false)
termostat1 = Thermostat.create(:serial => '1111',:id => '1',:user_id => '33',:temperature => '30',:humidity => '20',:location_id => '17')
location1= Location.create(:id => '17',:name => 'oficina',:address => 'ayacucho',:user_id => '33')