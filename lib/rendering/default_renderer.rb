module DefaultRenderer
  
  def css_classes
    [content.class.to_s.downcase]
  end
  
  def image
  end
  
  def title
    content.title
  end
  
  def text
    content.text[0...100] + "..."
  end
  
  def footer
  end
  
  def category
    content.category
  end
  
end