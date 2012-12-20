module WithTeaser
  
  # show the teaser image
  def header
    "TEASER IMAGE"
  end
  
  # shorten text
  def text
    @content.text[0...25] + "..."
  end
end