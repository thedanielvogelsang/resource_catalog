require 'rails_helper'

RSpec.feature "user adds new skill" do
    context "correctly" do
      scenario "and sees the skill added to the queue" do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_create_skills_path(user)
        fill_in "skill[skill]", with: "new skill"
        click_on "add a skill!"
        expect(current_path).to eq(user_skills_path(user))
        expect(page).to have_content "new skill"
      end
  end

  context "incorrectly" do
    scenario "and sees the skill added to the queue" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_create_skills_path(user)
      click_on "add a skill!"
      expect(page).to_not have_content "new skill"
      expect(page).to have_content "invalid skill."
    end
  end
end
