require 'pry'
require 'rails_helper'

describe 'ImportCatalogService', type: :service do

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

  context "#execute" do
    it "return true if all response was imported" do

      allow(HTTParty).to receive(:get).and_return(api_response)
      service = ImportCatalogService.new(store, 100)
      expect(service.execute).to be true
    end
  end
end

