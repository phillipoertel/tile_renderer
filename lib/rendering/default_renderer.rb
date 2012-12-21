module DefaultRenderer
  
  def css_classes
    [content.class.to_s.downcase]
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