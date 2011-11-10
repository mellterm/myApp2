require 'faker'
require 'populator'

	namespace :db do
		desc "Fill database with sample data"
		task :populate => :environment do
			Rake::Task['db:reset'].invoke
			
			make_users
		end	
	end
	
	def make_users
	  [User, Micropost].each(&:delete_all)
	  
	  admin = User.create!(
			:name => "Admin",
			:email => "splatt@mills.edu"
			)
		
		  10.times do |n|
				name = Faker::Name.name
				email = Faker::Internet.email
				
			User.create!(
				:name => name,
				:email => email	
				)
			end
	end	
			
					