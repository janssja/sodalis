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
  User.create!(:name => "Jackie Janssen",
               :email => "jackiejanssen@me.com",
               :password => "foobar",
               :password_confirmation => "foobar")

  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end