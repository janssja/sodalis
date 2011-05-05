Factory.define :user do |user|
  user.name                  "Flip Kowlier"
  user.email                 "Flip@me.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}.com"
end