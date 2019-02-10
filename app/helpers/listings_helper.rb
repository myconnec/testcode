module ListingsHelper
  def all_categories
    Category.order(:name)
  end
end

def website_link_text(uri)
  URI.parse(uri).host
end