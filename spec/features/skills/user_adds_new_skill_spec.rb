require 'rails_helper'

RSpec.feature "user adds new skill" do
    context "correctly" do
      scenario "and sees the skill added to the queue" do
        visit new_skill_path
        fill_in "skill[skill]", with: "new skill"
        click_on "add a skill!"
        expect(current_path).to eq(skills_path)
        expect(page).to have_content "new skill"
      end
  end

  context "incorrectly" do
    scenario "and sees the skill added to the queue" do
      visit new_skill_path
      click_on "add a skill!"
      expect(page).to_not have_content "new skill"
      save_and_open_page
    end
  end
end
