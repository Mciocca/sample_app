FactoryGirl.define do
  factory :user do
    name     "Michael Ciocca"
    email    "mciocca89@example.com"
    password "foobar"
    password_confirmation "foobar"
 

factory :admin do
	admin true
 end
end

factory :micropost do
	content "Lorem ipsum"
	user
 end
end

