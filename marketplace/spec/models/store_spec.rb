require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { create(:store) }

  it "responde to :name" do
    expect(store).respond_to?(:name)
  end

  it "responde to :catalog_source_api" do
    expect(store).respond_to?(:catalog_source_api)
  end

  it "responde to :email" do
    expect(store).respond_to?(:email)
  end

  it "responde to :password" do
    expect(store).respond_to?(:password)
  end
   
   
end
