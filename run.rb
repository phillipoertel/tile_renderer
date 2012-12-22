$LOAD_PATH.unshift('.')
require 'lib/tile_renderer'

video = Video.new(preview: 'video.mpg')
puts TileRenderer.render(video)

text = Text.new(teaser: 'teaser.mp4', description: "bla bla " * 100)
puts TileRenderer.render(text)

link = Link.new(link: 'http://www.sinatrarb.com')
puts TileRenderer.render(link)
