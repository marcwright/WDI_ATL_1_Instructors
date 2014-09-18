require "spec_helper"
require_relative "helpers/shared_context"
require_relative "helpers/shared_examples"
require_relative "../koopa_app"

describe "koopa app" do
  Capybara.app = KoopaApp
  let(:koopa_root) { "/" }                      # root path for koopa app
  let(:add_new_link) { "a.add-new" }            # link to add new koopas
  let(:edit_link) { "a.edit-link" }             # link to edit existing koopas
  let(:delete_link) { "a.delete-link" }         # link to edit existing koopas

  include_context "visits the site with existing koopa profiles"

  describe "the process of viewing a specific koopa" do
    before do
      visit koopa_root
      find("a.profile-1").click   # click on Beach Koopa's profile
    end

    it_behaves_like "a profile page", "Beach Koopa", "green", "//img[@src='/img/beach_koopa.png']"
  end

  describe "the process of creating a new koopa" do
    before do
      visit koopa_root
      find(add_new_link).click
      within "form" do
        fill_in "Name:", with: "Dry Bones"
        fill_in "Color:", with: "grey"
        fill_in "Photo URL:", with: "/img/dry_bones.png"
        click_button "Add Koopa"
      end
    end

    it_behaves_like "a profile page", "Dry Bones", "grey", "//img[@src='/img/dry_bones.png']"
  end

  describe "the process of editing a koopa" do
    before do
      visit koopa_root
      find("a.profile-2").click   # click on Boom Boom's profile
      find(edit_link).click
      within "form" do
        fill_in "Name:", with: "Spiny"
        fill_in "Color:", with: "red"
        fill_in "Photo URL", with: "/img/spiny.png"
        click_button "Edit Koopa"
      end
    end

    it_behaves_like "a profile page", "Spiny", "red", "//img[@src='/img/spiny.png']"
  end

  describe "the process of deleting a koopa" do
    it "deletes a koopa's profile" do
      visit koopa_root
      find("a.profile-3").click   # click on Chargin' Chuck's profile
      within "form" do
        click_button "Delete Koopa"
      end

      expect(page).to have_no_content "Chargin' Chuck"
    end
  end
end
