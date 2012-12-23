class TileRenderer::Renderer

  class << self
    def render(content)
      new(content).render
    end
    private :new
  end  
  
  def initialize(content)
    @content = content
  end
  
  def render
    template_data = TileRenderer::TemplateData.for(@content)
    Haml::Engine.new(template).render(template_data)
  end

  private
  
    def template
      f = File.expand_path(File.join(File.dirname(__FILE__), 'views/tile.html.haml'))
      File.read(f)
    end
end