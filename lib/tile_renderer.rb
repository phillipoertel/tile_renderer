$LOAD_PATH.unshift("lib/models")
$LOAD_PATH.unshift("lib/rendering")

# gems
require 'haml'

# domain models
require 'content'
require 'video'
require 'link'
require 'text'

## rendering modules
require 'default_renderer'
require 'with_teaser'
require 'with_preview'
require 'with_link'

# presentation/rendering object
require 'tile_renderer'