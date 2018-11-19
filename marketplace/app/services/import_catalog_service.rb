
class ImportCatalogService
  def initialize(store, max)
    @store = store
    @to = 9
    @from = 0
    @max = max

    @products = []
  end


  def execute 
    import!
  end


  private

    def import!
      return false if @store.catalog_source_api.blank?

      (@max / @to).to_i.times {
        response = HTTParty.get("#{@store.catalog_source_api}?_from=#{@from}&_to=#{@to}", format: :plain)
        parserd_response = JSON.parse response, symbolize_names: true
        if parserd_response.respond_to? :each
          @from = @to
          @to += @to
          @products.concat parserd_response
        end

      }

      total_imported = 0
      @products.each { |line|
        args = product_args_from(line)
        total_imported += 1 if Product.where(name: args[:name]).first_or_create( args )
      }

      @products.size == total_imported 
    end

    def product_args_from(line)
     {
        name: line[:productName],
        list_price: line[:items].first[:sellers].first[:commertialOffer][:ListPrice],
        price: line[:items].first[:sellers].first[:commertialOffer][:Price],
        installments_number: get_installments_number(line),
        installments_value: get_installments_value(line),
        image: line[:items].first[:images].first[:imageUrl],
        store_id: @store.id 
      } 
    end

    def get_installments_number(line)
      line[:items].first[:sellers].first[:commertialOffer][:Installments].blank? ?
        0
      :
        line[:items].first[:sellers].first[:commertialOffer][:Installments][3][:NumberOfInstallments]
    end

    def get_installments_value(line)
      line[:items].first[:sellers].first[:commertialOffer][:Installments].blank? ?
        0
      :
        line[:items].first[:sellers].first[:commertialOffer][:Installments][3][:Value]
    end

end

