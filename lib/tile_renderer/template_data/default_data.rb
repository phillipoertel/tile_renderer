require 'forwardable'

module DefaultData

  # some attributes are just passed through
  extend Forwardable
  def_delegators :content, :category, :title, :preview

  # these are rendering-specific, but nil by default
  attr_reader :image, :footer
  
  def css_classes
    classes = [content.class.to_s.downcase]
    classes << 'show-category' if content.category
    classes
  end
  
  def text
    content.description && content.description[0...100]
  end
  
end