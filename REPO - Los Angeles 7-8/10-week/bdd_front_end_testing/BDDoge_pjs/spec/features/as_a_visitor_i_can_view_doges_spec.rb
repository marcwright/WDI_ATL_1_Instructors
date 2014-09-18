require 'spec_helper'

feature 'As a visitor to the site, I should be able to view doge photos' do
  background do
    @doge1 = Doge.create(:name => "Cappy", :description => "So short! Much squat")
    @doge2 = Doge.create(:name => "Oscar", :description => "Evn shrtr, wow!")
  end

  scenario "i should see name and description" do
    visit "/"
    click_link "See all Doges! Mawrr"
    within "ul#doges" do
      expect(page).to have_selector("li", :text => "Cappy: So short! Much squat")
      expect(page).to have_selector("li", :text => "Oscar: Evn shrtr, wow!")
      # page.driver.debug
    end
  end
end