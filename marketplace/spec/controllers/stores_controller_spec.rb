require 'rails_helper'

RSpec.describe StoresController do
  describe "GET index" do
    it "http status 200" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
