$LOAD_PATH.unshift("lib/models")
$LOAD_PATH.unshift("lib/rendering")

# domain models
require 'content'
require 'video'
require 'link'
require 'text'

# presentation/rendering object
require 'tile_renderer'