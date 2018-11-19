class StoresController < ApplicationController

  def index
    get_products
  end

  def import_catalog
    notice_message =  import! ? 'Catalogo foi importado' : 'Erro ao importar catalogo'

    redirect_to edit_store_registration_path, notice: notice_message
  end

  private

    def get_products
      page = params[:page].blank? ? 0 : params[:page]
      @products ||= params[:s].blank? ? Product.search('*').page(page).results : Product.search(params[:s]).page(page).results
    end

    def import!
      service = ImportCatalogService.new(current_store, 100)
      service.execute
    end
end
