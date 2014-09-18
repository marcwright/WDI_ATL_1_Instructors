require 'rails_helper'

RSpec.describe "features/edit", :type => :view do
  before(:each) do
    @feature = assign(:feature, Feature.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit feature form" do
    render

    assert_select "form[action=?][method=?]", feature_path(@feature), "post" do

      assert_select "input#feature_name[name=?]", "feature[name]"

      assert_select "input#feature_description[name=?]", "feature[description]"
    end
  end
end
