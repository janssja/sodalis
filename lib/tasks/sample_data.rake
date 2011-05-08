require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
#    make_microposts
#    make_relationships
  end
end

def make_users
  admin = User.create!(:name => "Jackie Janssen",
               :email => "jackiejanssen@me.com",
               :password => "foobar",
               :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
  
  User.all(:limit => 6).each do |user|
    50.times do
      user.microposts.create!(:activity => Faker::Lorem.sentence(5),
                              :location => Faker::Lorem.sentence(1))
    end
  end
end