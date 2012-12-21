$LOAD_PATH.unshift("lib/models")
$LOAD_PATH.unshift("lib/rendering")

# gems
require 'haml'

# domain models
require 'content'
require 'video'
require 'link'
require 'text'
require 'html_text'

## rendering modules
require 'default_renderer'
require 'with_teaser'
require 'with_preview'
require 'with_link'
require 'with_video'
require 'with_text'
require 'with_html_text'

# presentation/rendering object
require 'tile_renderer'