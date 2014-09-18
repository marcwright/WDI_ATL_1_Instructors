shared_examples "a profile page" do |name, color, href|
  it "displays profile info" do
    expect(page).to have_content name
    expect(page).to have_content color
    expect(page).to have_xpath href
  end
end
