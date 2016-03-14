require 'rails_helper'
describe Article do
    it "should have many comments" do
    t = Article.reflect_on_association(:comments)
    t.macro.should == :has_many
  end

  it "has a valid factory" do
    FactoryGirl.create(:article).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:article, title: nil).should_not be_valid
  end

  it "is invalid without a text" do
    FactoryGirl.build(:article, text: nil).should_not be_valid
  end

  it "returns a article's full name as a string" do
    article = FactoryGirl.create(:article , title: "Plane", text: "Airindia")
    article.name.should == "Plane Airindia"
  end
      
  # describe "filter last name by letter" do
  #   it "returns a sorted array of results that match" do
  #     airindia = FactoryGirl.create(:article, text: "Airindia")
  #     plane    = FactoryGirl.create(:article, text: "Plane")
  #     pencil   = FactoryGirl.create(:article, text: "Pencil")
  #     Article.by_letter("P").should == [plane, pencil]
  #   end

  #   it "returns a sorted array of results that match" do
  #   airindia = FactoryGirl.create(:article, text: "Airindia")
  #   plane    = FactoryGirl.create(:article, text: "Plane")
  #   pencil   = FactoryGirl.create(:article, text: "Pencil")
  #   Article.by_letter("P").should_not include airindia
  #   end
  # end
end
