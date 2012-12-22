module WithTeaser
  
  # show the image
  def image
    content.teaser
  end
    
  # shorten text
  def text
    super && super[0...25]
  end
  
  # set css so that header div is shown
  def css_classes
    super + ['show-image']
  end
  
end