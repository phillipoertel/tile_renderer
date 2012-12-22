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
    # assign to @extensions first so this can be debugged easily (see attr_reader)
    def configure_renderer!
      @extensions = [DefaultRenderer]
      @extensions << Adapter::Link if content.is_a?(Link)
      @extensions << Adapter::HtmlText if content.is_a?(HtmlText)
      @extensions << WithPreview if content.has_preview?
      @extensions << WithTeaser if content.has_teaser?
      @extensions.each { |e| extend(e) }
    end

end