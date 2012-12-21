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
      extensions << extension_for_content_type
      extensions << WithPreview if content.has_preview?
      extensions << WithTeaser if content.has_teaser?
      extensions.each { |e| extend(e) }
    end
  
    def extension_for_content_type
      Kernel.const_get("With#{content.class}")
    end
end