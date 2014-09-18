require 'rails_helper'

RSpec.describe "features/index", :type => :view do
  before(:each) do
    assign(:features, [
      Feature.create!(
        :name => "Name",
        :description => "Description"
      ),
      Feature.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of features" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
