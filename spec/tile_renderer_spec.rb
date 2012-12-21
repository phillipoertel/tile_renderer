require 'spec_helper'

describe TileRenderer do

  let(:tile) { TileRenderer.for(content) }
  
  context "A plain text" do
    let(:content) { Text.new }
    it "has no preview image" do
      tile.title.should == content.title
    end
    it "has an empty footer" do
      tile.footer.should be_nil
    end
  end
  
  context "A video with teaser image" do
    let(:content) { Video.new(preview: 'video.mpg', teaser: "TEASER IMAGE") }
    it "has content.teaser as image" do
      tile.image.should == content.teaser
    end
    it "has an empty footer" do
      tile.footer.should be_nil
    end
    it "has additional css classes" do
      tile.css_classes.should include("show-image")
    end
  end
  
  context "A link with teaser image" do
    let(:content) { Link.new(link: 'http://www.sinatrarb.com', teaser: "TEASER IMAGE") }
    it "has content.teaser as image" do
      tile.image.should == content.teaser
    end
    it "has a link in the footer" do
      tile.footer.should == content.link
    end
    it "has additional css classes" do
      tile.css_classes.should include("show-image")
      tile.css_classes.should include("show-footer")
    end
  end
  
  context "A HTML text with category" do
    let(:content) { HtmlText.new(content: 'Bla bla <b>HTML</b>', category: "ARTICLE") }
    it "has content.content as text" do
      tile.text.should == content.content
    end
    it "has the category" do
      tile.category.should == content.category
    end
    it "has additional css classes" do
      tile.css_classes.should include("show-category")
    end
  end
  
end

describe "TileRenderer with renderered view (to test integration)" do
  
  let(:html) { TileRenderer.for(content).render }
  
  context "A link with teaser image" do
    let(:content) { Link.new(link: 'http://www.sinatrarb.com', teaser: "TEASER IMAGE") }
    it "has content.teaser as image" do
      html.should have_tag("div[class=image]", /#{content.teaser}/)
    end
    it "has a link in the footer" do
      html.should have_tag("div[class=footer]", /#{content.link}/)
    end
    it "has additional css classes" do
      html.should have_tag("div[class~=show-image]")
      html.should have_tag("div[class~=show-footer]")
    end
  end
  
end