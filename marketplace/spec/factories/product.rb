FactoryBot.define do
  factory :product do
    name { "Relogio" }
    store_id  { 1 }
    price { 10.00 }
    list_price { 15.00 }
    installments_number { 1 }
    installments_value { 10.00 }
    image { "https://localhost/src/img.svg" }

  end
end
