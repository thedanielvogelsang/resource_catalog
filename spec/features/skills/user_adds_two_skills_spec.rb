require 'rails_helper'

RSpec.feature "user adds two new skills" do
    context "correctly" do
      scenario "and sees both on the screen" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_create_skills_path(user)
        fill_in "skill[skill]", with: "skill 1"
        click_on "add a skill!"
        expect(current_path).to eq(user_skills_path(user))
        expect(page).to have_content "skill 1"

        expect(page).to have_css("//form#new_skill")
        fill_in "skill[skill]", with: "skill 2"
        click_on "add a skill!"
        expect(current_path).to eq(user_skills_path(user))
        expect(page).to have_content "skill 1"
        expect(page).to have_content "skill 2"
      end
    end
  end
