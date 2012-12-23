require 'spec_helper'

describe TileRenderer::TemplateData do

  When(:data) { TileRenderer::TemplateData.for(content) }

  context "The simplest possible content element" do
    Given(:content) { Content.new(title: "Hello World") }
    Then { data.image.should be_nil }
    And { data.category.should be_nil }
    And { data.title.should == "Hello World" }
    And { data.text.should be_nil }
    And { data.footer.should be_nil }
  end
  
  context "A content element with description" do
    Given(:content) { Content.new(title: "Hello World", description: "bla " * 50) }
    Then { data.text.length.should == 100 }
  end
  
  context "The image" do

    context "A content without image" do
      Given(:content) { Content.new }
      Then { data.image.should be_nil }
      And { data.css_classes.should == ['content'] }
    end

    context "A content with preview image" do
      Given(:content) { Content.new(preview: "PREVIEW IMAGE", description: "bla " * 50) }
      Then { data.image.should == "PREVIEW IMAGE" }
      And { data.text.length.should == 25 }
      And { data.css_classes.should include("show-image") }
    end

    context "A content with teaser image" do
      Given(:content) { Content.new(teaser: "TEASER IMAGE", description: "bla " * 50) }
      Then { data.image.should == "TEASER IMAGE" }
      And { data.text.length.should == 25 }
      And { data.css_classes.should include("show-image") }
    end

    context "A content with preview AND teaser image" do
      Given(:content) { Content.new(preview: 'PREVIEW IMAGE', teaser: "TEASER IMAGE", description: "bla " * 50) }
      Then { data.image.should == "TEASER IMAGE" }
      And { data.text.length.should == 25 }
      And { data.css_classes.should include("show-image") }
    end

  end
  
  context "A link" do
    Given(:content) { Link.new(link: 'http://www.sinatrarb.com') }
    Then { data.footer.should == 'http://www.sinatrarb.com' }
    And { data.css_classes.should include("show-footer") }
  end
    
  context "A content with category" do
    Given(:content) { Content.new(category: "ARTICLE") }
    Then { data.category.should == "ARTICLE" }
    And { data.css_classes.should include("show-category") }
  end

  context "An HTML text" do
    Given(:content) { HtmlText.new(content: 'Bla bla <b>HTML</b>') }
    Then { data.text.should == 'Bla bla <b>HTML</b>' }
  end
  
end
