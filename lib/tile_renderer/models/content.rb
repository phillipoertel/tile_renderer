class Content

  attr_accessor :category, :title, :content, :description, :text, :teaser, :preview
  
  def initialize(attributes = {})
    attributes.each { |k, v| instance_variable_set(:"@#{k}", v) }
  end
  
  def has_teaser?
    !!teaser
  end
  
  def has_preview?
    !!preview
  end
  
end