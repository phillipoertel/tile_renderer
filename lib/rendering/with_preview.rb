module WithPreview
  
  # show the image
  def image
    "PREVIEW IMAGE"
  end
  
  # shorten text
  def text
    content.text[0...25] + "..."
  end
  
  # set css so that header div is shown
  def css_classes
    super + ['show-image']
  end
  
end