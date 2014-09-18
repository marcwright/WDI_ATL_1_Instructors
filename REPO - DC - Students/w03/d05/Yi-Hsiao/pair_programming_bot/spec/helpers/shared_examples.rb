shared_examples "a question page" do |question|
  it "asks a question" do
    expect(page).to have_content question
  end

  it "has a 'Yes/No' option" do
    expect(page).to have_selector ".yes"
    expect(page).to have_selector ".no"
  end
end

shared_examples "an advice page" do |advice|
  it "gives advice" do
    expect(page).to have_content advice
  end

  it "has a 'Done' option" do
    expect(page).to have_selector ".done"
  end
end
