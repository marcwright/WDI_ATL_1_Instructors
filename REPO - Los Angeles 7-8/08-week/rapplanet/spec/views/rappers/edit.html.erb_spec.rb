require 'rails_helper'

RSpec.describe "rappers/edit", :type => :view do
  before(:each) do
    @rapper = assign(:rapper, Rapper.create!(
      :name => "MyString",
      :age => 1
    ))
  end

  it "renders the edit rapper form" do
    render

    assert_select "form[action=?][method=?]", rapper_path(@rapper), "post" do

      assert_select "input#rapper_name[name=?]", "rapper[name]"

      assert_select "input#rapper_age[name=?]", "rapper[age]"
    end
  end
end
