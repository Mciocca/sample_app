FactoryGirl.define do
  factory :user do
    name     "Michael Ciocca"
    email    "mciocca89@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end