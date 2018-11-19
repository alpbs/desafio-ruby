class StoresController < ApplicationController

  def index
    get_products
  end

  def import_catalog

    respond_to do |format|
      if import!
        format.html { redirect_to edit_store_registration_path, notice: 'Catalogo foi importado' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_store_registration_path, notice: 'Erro ao importar catalogo' }
        format.json { head :no_content }
      end
    end
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
