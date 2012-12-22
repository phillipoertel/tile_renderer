require 'spec_helper'

def tile_for(content)
  TileRenderer.for(content)
end

describe TileRenderer do

  context "The simplest possible content element" do
    Given(:tile) { tile_for(Content.new(title: "Hello World")) }
    Then { tile.image.should be_nil }
    And { tile.category.should be_nil }
    And { tile.title.should == "Hello World" }
    And { tile.text.should be_nil }
    And { tile.footer.should be_nil }
  end
  
  context "The image" do

    context "A content without image" do
      Given(:tile) { tile_for(Content.new) }
      Then { tile.image.should be_nil }
      And { tile.css_classes.should == ['content'] }
    end

    context "A content with preview image" do
      Given(:tile) { tile_for(Content.new(preview: "PREVIEW IMAGE", description: "bla " * 50)) }
      Then { tile.image.should == "PREVIEW IMAGE" }
      And { tile.text.length.should == 25 }
      And { tile.css_classes.should include("show-image") }
    end

    context "A content with teaser image" do
      Given(:tile) { tile_for(Content.new(teaser: "TEASER IMAGE", description: "bla " * 50)) }
      Then { tile.image.should == "TEASER IMAGE" }
      And { tile.text.length.should == 25 }
      And { tile.css_classes.should include("show-image") }
    end

    context "A content with preview AND teaser image" do
      Given(:tile) { tile_for(Content.new(preview: 'PREVIEW IMAGE', teaser: "TEASER IMAGE", description: "bla " * 50)) }
      Then { tile.image.should == "TEASER IMAGE" }
      And { tile.text.length.should == 25 }
      And { tile.css_classes.should include("show-image") }
    end

  end
  
  context "A link" do
    Given(:tile) { tile_for(Link.new(link: 'http://www.sinatrarb.com')) }
    Then { tile.footer.should == 'http://www.sinatrarb.com' }
    And { tile.css_classes.should include("show-footer") }
  end
    
  context "A content with category" do
    Given(:tile) { tile_for(Content.new(category: "ARTICLE")) }
    Then { tile.category.should == "ARTICLE" }
    And { tile.css_classes.should include("show-category") }
  end

  context "An HTML text" do
    Given(:tile) { tile_for(HtmlText.new(content: 'Bla bla <b>HTML</b>')) }
    Then { tile.text.should == 'Bla bla <b>HTML</b>' }
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