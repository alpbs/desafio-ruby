FactoryBot.define do
  factory :user do
    name { "admin" }
    password_digest { "admin" }
  end
end
