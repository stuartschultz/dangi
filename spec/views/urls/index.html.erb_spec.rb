require 'spec_helper'

describe "urls/index" do
  before(:each) do
    assign(:urls, [
      stub_model(Url,
        :url => "Url",
        :short_url => "Short Url",
        :url_views => 1,
        :user_id => 2
      ),
      stub_model(Url,
        :url => "Url",
        :short_url => "Short Url",
        :url_views => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of urls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Short Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
