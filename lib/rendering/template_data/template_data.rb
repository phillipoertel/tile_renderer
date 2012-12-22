class TemplateData
  
  def self.for(content)
    new(content)
  end
  
  private
  
    attr_reader :content
  
    def initialize(content)
      @content = content
      configure_self_for_content!
    end
    
    def configure_self_for_content!
      @extensions = [DefaultData]
      @extensions << WithLink if content.is_a?(Link)
      @extensions << WithHtmlText if content.is_a?(HtmlText)
      @extensions << WithPreview if content.has_preview?
      @extensions << WithTeaser if content.has_teaser?
      @extensions.each { |e| extend(e) }
    end
end