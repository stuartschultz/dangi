require 'spec_helper'

describe Url do

  context "database fields" do
    it { should have_db_column(:short_url_key).of_type(:string) }
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:url_views).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  context "validations" do
    it { should validate_presence_of :url}
  end
  
  context "relationships" do
    it { should belong_to(:user) }
  end
  
  context "with FactoryGirl" do
    before(:each) do
      @url = FactoryGirl.build(:url, :url_views => 3)
    end
    it "should return specified URL with short_url method" do 
      @url.short_url.should == "http://dangi.heroku.com/#{@url.short_url_key}"
    end    
    it "should increment url views by 1 each time short url is visited with increment_views method" do
      Url.increment_views(@url)
      @url.url_views.should == 4
    end
  end  
  
  context "#shorten_url" do
    before(:each) do
      url_to_shorten = "http://#{Faker::Internet.domain_name}"
      @url = Url.create(:url => url_to_shorten)
    end
    it "should generate a short URL key" do
      @url.short_url_key.should_not be_nil
    end
    it "should match the new short URL key to the URL" do
      found_url = Url.find_by_short_url_key(@url.short_url_key)
      found_url.url.should == @url.url
    end
  end
  
end