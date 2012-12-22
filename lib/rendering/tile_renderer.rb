class TileRenderer

  class << self
    def for(content)
      new(content)
    end
    private :new
  end  
  
  def initialize(content)
    @content = content
  end
  
  def template_data
    TemplateData.for(@content)
  end
  
  def render
    template = File.read('lib/rendering/tile.html.haml')
    Haml::Engine.new(template).render(template_data)
  end

end