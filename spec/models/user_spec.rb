require 'spec_helper'

describe User do

  context "relationships" do
    it { should have_many(:urls) }
  end

end
