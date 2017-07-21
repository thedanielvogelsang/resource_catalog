require 'rails_helper'

RSpec.feature "user adds new skill and clicks 'next'" do
    context "correctly" do
      scenario "and sees the assets/resources page" do
        user = create(:user)
        visit new_user_skill_path(user)
        fill_in "skill[skill]", with: "new skill"
        click_on "add a skill!"

        expect(page).to have_content "new skill"
        click_on "next"
        expect(page).to have_content "assets/resources"
      end
  end
end
