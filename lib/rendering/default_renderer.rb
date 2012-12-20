module DefaultRenderer
  
  def css_classes
    { class: [@content.class.to_s.downcase] }
  end
  
  def header
    @content.preview
  end
  
  def title
    @content.title
  end
  
  def text
    @content.text[0...100] + "..."
  end
  
  def footer
  end
  
end