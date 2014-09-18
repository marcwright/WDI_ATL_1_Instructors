require 'spec_helper'

describe "User can manage user" do
  let!(:john) { User.create(
    name: "John",
    email: "john@gmail.com",
    password: "password",
    password_confirmation: "password"
    )}

  it "can create a new user" do

    visit new_user_path
    fill_in "Name", with: "Joe"
    fill_in "Email", with: "joe@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_button("Submit")

    expect(page).to have_content "Joe"
  end

  it "can edit a user" do
    visit edit_user_path(john)
    fill_in "Name", with: "Johnny"
    fill_in "Email", with: "john@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_button("Submit")

    expect(page).to have_content "Johnny"
  end
end

#   it "can delete a song" do
#     visit artist_path(kesha)
#     click_button("Delete song")
#     expect(page).to_not have_content "Tik Tok"

#   end

# end
