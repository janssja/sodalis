Factory.define :user do |user|
  user.name                  "Flip Kowlier"
  user.email                 "Flip@me.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}.com"
end

Factory.define :micropost do |micropost|
  micropost.activity         "Foo bar"
  micropost.location         "home"
  micropost.association     :user  
end