class TileRenderer

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
    template = File.read('lib/rendering/tile.html.haml')
    template_data = TemplateData.for(@content)
    Haml::Engine.new(template).render(template_data)
  end

end