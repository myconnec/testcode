class PricesController < ApplicationController

  def index
    @chargable_sub_cat = Subcategory.includes(:category).where("chargable <> 0")
  end

end
