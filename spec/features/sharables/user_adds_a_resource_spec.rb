require 'rails_helper'

RSpec.feature "user adds a resource" do
    context "correctly" do
      scenario "and sees it on the screen" do
        user = create(:user)
        visit new_user_sharable_path(user)
        fill_in "sharable[sharable]", with: "sharable 1"
        click_on "offer a resource!"
        expect(current_path).to eq(user_sharables_path(user))
        expect(page).to have_content "sharable 1"
      end
    end
  end
