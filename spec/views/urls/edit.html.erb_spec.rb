require 'spec_helper'

describe "urls/edit" do
  before(:each) do
    @url = assign(:url, stub_model(Url,
      :url => "MyString",
      :short_url => "MyString",
      :url_views => 1,
      :user_id => 1
    ))
  end

  it "renders the edit url form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => urls_path(@url), :method => "post" do
      assert_select "input#url_url", :name => "url[url]"
      assert_select "input#url_short_url", :name => "url[short_url]"
      assert_select "input#url_url_views", :name => "url[url_views]"
      assert_select "input#url_user_id", :name => "url[user_id]"
    end
  end
end
