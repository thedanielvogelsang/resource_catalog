require 'rails_helper'

RSpec.feature "user adds three new resources and clicks next" do
    context "correctly" do
      scenario "and sees both on the screen" do
        visit new_sharable_path
        fill_in "sharable[sharable]", with: "asset 1"
        click_on "offer a resource!"
        fill_in "sharable[sharable]", with: "asset 2"
        click_on "offer a resource!"
        fill_in "sharable[sharable]", with: "asset 3"
        click_on "offer a resource!"
        expect(current_path).to eq(sharables_path)
        expect(page).to have_content "asset 1"
        expect(page).to have_content "asset 2"
        expect(page).to have_content "asset 3"
        click_on "complete me"
        expect(page).to have_content()
