module DefaultRenderer
  
  def css_classes
    [content.class.to_s.downcase]
  end
  
  def image
    content.has_preview? ? content.preview : nil
  end
  
  def title
    content.title
  end
  
  def text
    content.text[0...100] + "..."
  end
  
  def footer
  end
  
end