require 'spec_helper'

describe "urls/show" do
  before(:each) do
    @url = assign(:url, stub_model(Url,
      :url => "Url",
      :short_url => "Short Url",
      :url_views => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Short Url/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
