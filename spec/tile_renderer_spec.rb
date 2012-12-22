require 'spec_helper'

def tile_for(content)
  TileRenderer.render(content)
end

describe "TileRenderer with renderered view (to test integration)" do
  
  context "A link with teaser image" do
    Given(:html) { tile_for(Link.new(link: 'http://www.sinatrarb.com', teaser: "TEASER IMAGE")) }
    it "has content.teaser as image" do
      html.should have_tag("div[class=image]", /TEASER IMAGE/)
    end
    it "has a link in the footer" do
      html.should have_tag("div[class=footer]", %r{http://www.sinatrarb.com})
    end
    it "has additional css classes" do
      html.should have_tag("div[class~=show-image]")
      html.should have_tag("div[class~=show-footer]")
    end
  end
  
end