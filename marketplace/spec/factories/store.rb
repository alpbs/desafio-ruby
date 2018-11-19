FactoryBot.define do
  factory :store, class: 'Store' do
    name { "Relogio" }
    email { "test@test.com" }
    password { "123456" }
    catalog_source_api { "http://localhost/test" }
    id  { 1 }
  end

end

