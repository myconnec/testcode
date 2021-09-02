class PagesController < ApplicationController
  def about
  end

  def career
  end

  def contact
  end

  def faq
  end

  def howitworks
  end

  def newsletter
  end

  def offline
  end

  def prostterm
  end

  def pricing
    @chargable_sub_cat = Subcategory.includes(:category).where("chargable <> 0")
  end

  def privacy
  end

  def safetytips
  end

  def terms
  end

end