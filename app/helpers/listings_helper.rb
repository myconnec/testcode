module ListingsHelper
  def all_categories
    Category.order(:name)
  end
end

def website_link_text(uri)
  URI.parse(uri).host
end

def transliterate(str)
  # Based on permalink_fu by Rick Olsen
  # Source http://arvind-ror.blogspot.com/2013/04/make-url-friendly-filenames-in.html

  # Escape str by transliterating to UTF-8 with Iconv
  # s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s
  s = str

  # Downcase string
  s.downcase!
  
  # Remove spaces from beginning and end of string
  s.strip!

  # Remove apostrophes so isn't changes to isnt
  s.gsub!(/'/, '')

  # Replace any non-letter or non-number character with a space
  s.gsub!(/[^A-Za-z0-9]+/, ' ')

  # Replace groups of spaces with single hyphen
  s.gsub!(/\ +/, '-')

  return s
end