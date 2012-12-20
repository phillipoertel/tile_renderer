require 'ostruct'

class Content < OpenStruct
  
  def preview
    "PREVIEW IMAGE"
  end
  
  def title 
    "Content Title"
  end
  def text
    "Das ist das Haus vom Nikolaus. " * 10
  end
  def has_teaser?
    !!teaser
  end
end