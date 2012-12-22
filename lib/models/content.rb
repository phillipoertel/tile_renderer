require 'ostruct'

class Content < OpenStruct

  def has_teaser?
    !!teaser
  end
  
  def has_preview?
    !!preview
  end
  
end