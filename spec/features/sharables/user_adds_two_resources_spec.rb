require 'rails_helper'

RSpec.feature "user adds two new resources" do
    context "correctly" do
      scenario "and sees both on the screen" do
        user = create(:user)
        skill1, skill2, skill3 = create_list(:skill, 3)
        user.skills << skill1
        user.skills << skill2
        user.skills << skill3
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_create_sharables_path(user)
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
