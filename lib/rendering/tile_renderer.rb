class TileRenderer

  attr_reader :content
  
  def self.for(content)
    new(content)
  end
  
  def initialize(content)
    @content = content
    configure_renderer!
  end
  
  def render
    template = File.read('lib/rendering/tile.html.haml')
    Haml::Engine.new(template).render(self)
  end
  
  private
  
  # sets self up to render the given content correctly
  def configure_renderer!
    extend(DefaultRenderer)
    extend(WithTeaser) if content.has_teaser?
    extend(WithLink) if content.is_a?(Link)
  end
  
end