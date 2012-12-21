require 'ostruct'

class Content < OpenStruct
  
  def title 
    "Content Title"
  end
  
  def description
    "Das ist die Beschreibung vom Haus des Nikolaus. " * 10
  end
  
  def has_teaser?
    !!teaser
  end
  def has_preview?
    !!preview
  end
end