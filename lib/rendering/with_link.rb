module WithLink
  
  # insert link into footer
  def footer
    content.link
  end
  
  # set css so that footer div is shown
  def css_classes
    super + ['show-footer']
  end
  
end