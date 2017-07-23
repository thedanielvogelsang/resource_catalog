require 'rails_helper'

RSpec.feature "user adds three new resources and clicks next" do
    context "when they're not logged in" do
      scenario "and sees a 404 page" do
        user = create(:user)
        skill1, skill2, skill3 = create_list(:skill, 3)
        user.skills << skill1
        user.skills << skill2
        user.skills << skill3
        visit user_create_sharables_path(user)
        fill_in "sharable[sharable]", with: "asset 1"
        click_on "offer a resource!"
        fill_in "sharable[sharable]", with: "asset 2"
        click_on "offer a resource!"
        fill_in "sharable[sharable]", with: "asset 3"
        click_on "offer a resource!"
        expect(current_path).to eq(user_sharables_path(user))
        expect(page).to have_content "asset 1"
        expect(page).to have_content "asset 2"
        expect(page).to have_content "asset 3"
        click_on "complete sign-up"
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
