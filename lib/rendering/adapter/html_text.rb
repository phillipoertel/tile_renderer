module Adapter::HtmlText
  
  def text
    content.content && content.content[0...25]
  end
  
end