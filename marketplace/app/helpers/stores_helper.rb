module StoresHelper
  def store?
    ! @store.nil?
  end


  def first_product_img(product)
    product.items.first[:images].first[:imageUrl] unless product.nil? or product.items.blank?
  end

  def product_list_price(product)
    product.items.first[:sellers].first[:commertialOffer][:ListPrice] unless product.nil? or product.items.blank?
  end

  def product_price(product)
    product.items.first[:sellers].first[:commertialOffer][:Price] unless product.nil? or product.items.blank?
  end

  def product_installments_number(product)
    product.items.first[:sellers].first[:commertialOffer][:Installments][2][:NumberOfInstallments] unless product.nil? or product.items.blank?
  end

  def product_installments_value(product)
    product.items.first[:sellers].first[:commertialOffer][:Installments][2][:Value] unless product.nil? or product.items.blank?
  end


end
