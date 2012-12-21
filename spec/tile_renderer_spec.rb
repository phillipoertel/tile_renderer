require 'spec_helper'

describe TileRenderer do

  let(:html) { TileRenderer.for(content).render }
  
  context "A plain text" do
    let(:content) { Text.new }
    it "has no preview image" do
      html.should have_tag("div[class=image]", /\A\s+\Z/)
    end
    it "has an empty footer" do
      html.should have_tag("div[class=footer]", /\A\s+\Z/)
    end
  end
  
  context "A video with teaser image" do
    let(:content) { Video.new(preview: 'video.mpg', teaser: "TEASER IMAGE") }
    it "has content.teaser as image" do
      html.should have_tag("div[class=image]", /#{content.teaser}/)
    end
    it "has an empty footer" do
      html.should have_tag("div[class=footer]", /\A\s+\Z/)
    end
    it "has additional css classes" do
      html.should have_tag("div[class~=show-image]")
    end
  end
  
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