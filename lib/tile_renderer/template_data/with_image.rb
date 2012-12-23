module TileRenderer::TemplateData::WithImage

  # show the image
  def image
    if (content.has_preview? && content.has_teaser?)
      content.teaser
    elsif content.has_preview?
      content.preview
    elsif content.has_teaser?
      content.teaser
    end
  end
  
  # shorten text
  def text
    super && super[0...25]
  end
  
  # set css so that header div is shown
  def css_classes
    super + ['show-image']
  end
  
end