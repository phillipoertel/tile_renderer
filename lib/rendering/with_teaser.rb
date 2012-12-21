module WithTeaser
  
  # show the teaser image
  def image
    "TEASER IMAGE"
  end
  
  # shorten text
  def text
    super[0...25]
  end
  
  # set css so that header div is shown
  def css_classes
    super + ['show-image']
  end
  
end