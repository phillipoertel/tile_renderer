class TileRenderer

  attr_reader :content, :extensions
  
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
    # assign to rendering_extensions first so this can be debugged easily (see attr_reader)
    def configure_renderer!
      extensions = [DefaultRenderer]
      extensions << content_rendering_adapter
      extensions << WithPreview if content.has_preview?
      extensions << WithTeaser if content.has_teaser?
      extensions.each { |e| extend(e) }
    end
  
    def content_rendering_adapter
      Adapter.const_get(content.class.to_s.to_sym)
    end
end