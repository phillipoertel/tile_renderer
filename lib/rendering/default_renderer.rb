module DefaultRenderer
  
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