require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:store) { create(:store) }
  let(:product) { create(:product, store_id: store.id) }
  
  it "respond to :name" do
    expect(product).respond_to?(:name)
  end

  it "respond to :list_price" do
    expect(product).respond_to?(:list_price)
  end

  it "respond to :price" do
    expect(product).respond_to?(:price)
  end

  it "respond to :store_id" do
    expect(product).respond_to?(:store_id)
  end

  it "respond to :installments_number" do
    expect(product).respond_to?(:installments_number)
  end

  it "respond to :installments_value" do
    expect(product).respond_to?(:installments_value)
  end

  it "respond to :image" do
    expect(product).respond_to?(:image)
  end
end
