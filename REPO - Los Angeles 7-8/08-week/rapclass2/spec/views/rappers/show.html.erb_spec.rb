require 'rails_helper'

RSpec.describe "rappers/show", :type => :view do
  before(:each) do
    @rapper = assign(:rapper, Rapper.create!(
      :name => "Name",
      :age => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
