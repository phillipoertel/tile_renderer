$LOAD_PATH.unshift('.')
require 'lib/tile_renderer'

video = Video.new(preview: 'video.mpg', teaser: 'teaser.mp4')
p TileRenderer.for(video).render

link = Link.new(link: 'http://www.sinatrarb.com')
p TileRenderer.for(link).render
