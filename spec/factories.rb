Factory.define :user do |user|
  user.name                  "Jackie Janssen"
  user.email                 "jackie@amuzega.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :micropost do |micropost|
  micropost.activity "Foo bar"
  micropost.location "home"
  micropost.association :user
end