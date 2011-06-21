# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:name => 'Mat', :brouzouf => 100.0, :email => 'mathieu@marache.com', :encrypted_password => '$2a$10$ycGWY/je6xt1EqG9e.ZeduG20fw7GdF9NPa6rMmEShNJJxT4ozZK2')