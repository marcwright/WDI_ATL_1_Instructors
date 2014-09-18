require 'spec_helper'

feature 'As a visitor to the site, I should see the homepage', :js => true do
  scenario "I should see the title and a shibu inu" do
    visit "/"
    expect(page).to have_selector('h1', text: "Welcome to Doge Palace")
    expect(page).to have_image("dogewelcome.gif")
    expect(page).to have_content("Such BDD! Much spec! 3lite Programr!")
    # page.driver.debug
  end

  scenario "I should see a link to view doges" do
    visit "/"
    expect(page).to have_link("See all Doges! Mawrr", :href => doges_path)
  end

end
