require 'spec_helper'

describe "TileRenderer with renderered view (to test integration)" do
  
  context "A link with teaser image" do
    Given(:content) { Link.new(link: 'http://www.sinatrarb.com', teaser: "TEASER IMAGE") }
    When(:html) { TileRenderer.render(content) }
    Then { html.should have_tag("div[class=image]", /TEASER IMAGE/) }
    And { html.should have_tag("div[class=footer]", %r{http://www.sinatrarb.com}) }
    And { html.should have_tag("div[class~=show-image]") }
    And { html.should have_tag("div[class~=show-footer]") }
  end
  
end