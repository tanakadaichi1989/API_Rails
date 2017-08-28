# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Timetable.create(:dept_time => "07:00", :train_type => "特急", :destination => "出町柳" ,:memo => "３扉車")

require 'csv'


CSV.foreach('db/yodoyabashi.csv') do |row|
    Timetable.create(:dept_time => row[0], :train_type => row[1], :destination => row[2], :memo => row[3])
end
