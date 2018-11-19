require "rails_helper"


RSpec.describe "Stores", :type => :request do

  let!(:store) { create(:store) }
  let!(:api_response) {
    [
      {
        productName: "Relógio",
        items: [
          {
            name: "Teste",
            images: [ {imageUrl: 'http://localhost/'} ],
            sellers: [
              {
                name: "Teste",
                commertialOffer: {
                  ListPrice: '15.00',
                  Price: '10.00',
                  installments: [ {},{},{},{} ]
                }
              }
            ]
          }
        ]
      }
    ].to_json
  }


  it "Get index template" do
    get "/"
    expect(response).to have_http_status(200)
  end 

  it "Get import action with logged store" do
    sign_in store

    allow(HTTParty).to receive(:get).and_return(api_response)
    get "/stores/#{store.id}/import_catalog"

    expect(response).to redirect_to(:edit_store_registration)
  end

  it "Get import action without logged store" do
    allow(HTTParty).to receive(:get).and_return(api_response)
    get "/stores/#{store.id}/import_catalog"

    expect(response).to redirect_to(:new_store_session)
  end
end
