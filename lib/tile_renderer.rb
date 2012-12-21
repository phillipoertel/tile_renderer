$LOAD_PATH.unshift("lib")

# gems
require 'haml'

# domain models
require 'models/content'
require 'models/video'
require 'models/link'
require 'models/text'
require 'models/html_text'

# presentation/rendering object
require 'rendering/tile_renderer'

## rendering modules and adapters
require 'rendering/default_renderer'
require 'rendering/with_teaser'
require 'rendering/with_preview'

module Adapter; end

require 'rendering/adapter/link'
require 'rendering/adapter/video'
require 'rendering/adapter/text'
require 'rendering/adapter/html_text'