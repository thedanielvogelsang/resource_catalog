require 'rails_helper'

RSpec.feature "user adds two new skills" do
    context "correctly" do
      scenario "and sees both on the screen" do
        visit new_skill_path
        fill_in "skill[skill]", with: "skill 1"
        click_on "add a skill!"
        expect(current_path).to eq(skills_path)
        expect(page).to have_content "skill 1"

        expect(page).to have_css("//form#new_skill")
        fill_in "skill[skill]", with: "skill 2"
        click_on "add a skill!"
        expect(current_path).to eq(skills_path)
        expect(page).to have_content "skill 1"
        expect(page).to have_content "skill 2"
        save_and_open_page
      end
    end
  end
