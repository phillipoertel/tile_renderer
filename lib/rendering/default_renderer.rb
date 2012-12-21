module DefaultRenderer
  
  def css_classes
    classes = [content.class.to_s.downcase]
    classes << 'show-category' if content.category
    classes
  end
  
  def image
  end
  
  def category
    content.category
  end
  
  def title
    content.title
  end
  
  def text
    content.description[0...100]
  end
  
  def footer
  end
  
end