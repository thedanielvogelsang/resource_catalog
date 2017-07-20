require 'rails_helper'

RSpec.feature "user adds new skill" do
    context "correctly" do
      scenario "and sees the skill added to the queue" do
        visit new_skill_path
        fill_in "skill[skill]", with: "new skill"
        click_on "add a skill!"
        expect(current_path).to eq(new_skill_path)
        expect(page).to have_content "new skill"
      end
  end
end
