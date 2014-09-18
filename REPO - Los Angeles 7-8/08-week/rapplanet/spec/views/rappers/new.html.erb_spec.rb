require 'rails_helper'

RSpec.describe "rappers/new", :type => :view do
  before(:each) do
    assign(:rapper, Rapper.new(
      :name => "MyString",
      :age => 1
    ))
  end

  it "renders new rapper form" do
    render

    assert_select "form[action=?][method=?]", rappers_path, "post" do

      assert_select "input#rapper_name[name=?]", "rapper[name]"

      assert_select "input#rapper_age[name=?]", "rapper[age]"
    end
  end
end
