require "spec_helper"

describe "the compliment app" do
  Capybara.app = ComplimentApp

  context "when a user visits the homepage" do
    before { visit "/" }

    it "gives a generic greeting" do
      expect(page).to have_content "Hello"
    end

    it "gives the user a random compliment" do
      expect(page).to have_selector "#compliment"
    end
  end

  context "when a user visits a personalized link" do
    it "greets a person with one name" do
      visit "/randy"
      expect(page).to have_content "Hello Randy"
    end

    it "greets a person with two names" do
      visit "/yi-hsiao/liu"
      expect(page).to have_content "Hello Yi-hsiao Liu"
    end
  end

  describe "the process to submit a new compliment" do
    before do
      visit "/"
      within "#compliment_submission" do
        fill_in "Submit a new compliment:", with: "You look beautiful, darling."
        click_button "Submit"
      end
    end

    it "thanks the user for their submission" do
      expect(page).to have_content "Thank you for submitting a compliment."
    end
  end
end
