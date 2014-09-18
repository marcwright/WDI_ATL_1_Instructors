require "spec_helper"
require_relative "../lib/pair_programming"

describe "pair programming bot" do
  Capybara.app = PairProgrammingBot

  describe "'do you have a test?' page" do
    before do
      visit "/"
    end

    it_behaves_like "a question page", "Do you have a test for that?"

    context "when the user answers 'Yes'" do
      before { click_link "Yes" }
      it_behaves_like "a question page", "Does the test pass?"
    end

    context "when the user answers 'No'" do
      before { click_link "No" }
      it_behaves_like "an advice page", "Write a test."

      context "when the user is done" do
        before { click_link "Done" }
        it_behaves_like "a question page", "Does the test pass?"
      end
    end
  end

  describe "'did your test pass?' page" do
    before do
      visit "/"
      click_link "Yes"
    end

    context "when the user answers 'Yes" do
      before { click_link "Yes" }
      it_behaves_like "a question page", "Need to refactor?"
    end

    context "when the user answers 'No'" do
      before { click_link "No" }
      it_behaves_like "an advice page", "Write just enough code for the test to pass."

      context "when the user is done" do
        before { click_link "Done" }
        it_behaves_like "a question page", "Need to refactor?"
      end
    end
  end

  describe "'need to refactor?' page" do
    before do
      visit "/"
      2.times { click_link "Yes" }
    end

    context "when the user answers 'Yes" do
      before { click_link "Yes" }
      it_behaves_like "an advice page", "Refactor the code."

      context "when the user is done" do
        before { click_link "Done" }
        it_behaves_like "a question page", "Does the test pass?"
      end
    end

    context "when the user answers 'No'" do
      before { click_link "No" }
      it_behaves_like "an advice page", "Select a new feature to implement."

      context "when the user is done" do
        before { click_link "Done" }
        it_behaves_like "a question page", "Do you have a test for that?"
      end
    end
  end
end
