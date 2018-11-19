require 'elasticsearch/model'

class Product
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :name, type: String
  field :image, type: String
  field :list_price, type: String
  field :price, type: BigDecimal
  field :installments_number, type: Integer
  field :installments_value, type: BigDecimal
  field :store_id, type: BSON::ObjectId

  belongs_to :store

  settings index: {
    number_of_shards: 1,
    number_of_replicas: 0,
    analysis: {
      analyzer: {
        pattern: {
          type: 'pattern',
          pattern: "\\s|_|-|\\.",
          lowercase: true
        },
        trigram: {
          tokenizer: 'trigram'
        }
      },
      tokenizer: {
        trigram: {
          type: 'ngram',
          min_gram: 3,
          max_gram: 3,
          token_chars: ['letter', 'digit']
        }
      }
    } } do
    mapping do
      indexes :name, type: 'text', analyzer: 'portuguese'
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      only: [:name, :list_price, :price, :installments_number, :installments_value, :image],
    )
  end  

end

Product.import force: true
