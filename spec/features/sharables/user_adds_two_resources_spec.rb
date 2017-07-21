require 'rails_helper'

RSpec.feature "user adds two new resources" do
    context "correctly" do
      scenario "and sees both on the screen" do
        user = create(:user)
        visit new_user_sharable_path(user)
        fill_in "sharable[sharable]", with: "asset 1"
        click_on "offer a resource!"
        expect(current_path).to eq(user_sharables_path(user))
        expect(page).to have_content "asset 1"

        expect(page).to have_css("//form#new_sharable")
        fill_in "sharable[sharable]", with: "asset 2"
        click_on "offer a resource!"
        expect(current_path).to eq(user_sharables_path(user))
        expect(page).to have_content "asset 1"
        expect(page).to have_content "asset 2"
      end
    end
  end
