require 'rails_helper'

RSpec.feature "user adds two new resources" do
    context "correctly" do
      scenario "and sees both on the screen" do
        visit new_sharable_path
        fill_in "sharable[sharable]", with: "asset 1"
        click_on "offer a resource!"
        save_and_open_page
        expect(current_path).to eq(sharables_path)
        expect(page).to have_content "asset 1"

        expect(page).to have_css("//form#new_sharable")
        fill_in "sharable[sharable]", with: "asset 2"
        click_on "offer a resource!"
        expect(current_path).to eq(sharables_path)
        expect(page).to have_content "asset 1"
        expect(page).to have_content "asset 2"
        save_and_open_page
      end
    end
  end
