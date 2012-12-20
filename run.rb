$LOAD_PATH.unshift("lib/models")
$LOAD_PATH.unshift("lib/rendering")

# domain models
require 'content'
require 'video'
require 'link'

# presentation/rendering object
require 'tile_renderer'

video = Video.new(preview: 'video.mpg', teaser: 'teaser.mp4')
p TileRenderer.for(video).render

link = Link.new(link: 'http://www.sinatrarb.com')
p TileRenderer.for(link).render
