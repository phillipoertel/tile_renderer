require 'spec_helper'

def tile_for(content)
  TileRenderer.for(content)
end

describe TileRenderer do

  context "A plain text" do
    Given(:tile) { tile_for(Text.new(title: "Hello World")) }
    Then { tile.image.should be_nil }
    And { tile.title.should == "Hello World" }
    And { tile.footer.should be_nil }
  end
  
  context "A video with teaser image" do
    Given(:tile) { tile_for(Video.new(preview: 'video.mpg', teaser: "TEASER IMAGE")) }
    Then { tile.image.should == "TEASER IMAGE" }
    And { tile.footer.should be_nil }
    And { tile.css_classes.should include("show-image") }
  end
  
  context "A link with teaser image" do
    Given(:tile) { tile_for(Link.new(link: 'http://www.sinatrarb.com', teaser: "TEASER IMAGE")) }
    Then { tile.image.should == "TEASER IMAGE" }
    And { tile.footer.should == 'http://www.sinatrarb.com' }
    And { tile.footer.should == 'http://www.sinatrarb.com' }
    And { tile.css_classes.should include("show-image") }
    And { tile.css_classes.should include("show-footer") }
  end
  
  context "A HTML text with category" do
    Given(:tile) { tile_for(HtmlText.new(content: 'Bla bla <b>HTML</b>', category: "ARTICLE")) }
    it "has content.content as text" do
      tile.text.should == 'Bla bla <b>HTML</b>'
    end
    it "has the category" do
      tile.category.should == "ARTICLE"
    end
    it "has additional css classes" do
      tile.css_classes.should include("show-category")
    end
  end
  
end

describe "TileRenderer with renderered view (to test integration)" do
  
  context "A link with teaser image" do
    Given(:html) { tile_for(Link.new(link: 'http://www.sinatrarb.com', teaser: "TEASER IMAGE")).render }
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