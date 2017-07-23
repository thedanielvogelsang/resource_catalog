require 'rails_helper'

RSpec.feature "user tries to edit/delete community" do
  context "but is not an admin" do
    scenario "and cannot see delete or edit buttons on page" do
      user = create(:user)
      skill1, skill2, skill3 = create_list(:skill, 3)
      user.skills << skill1
      user.skills << skill2
      user.skills << skill3
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      community1, community2 = create_list(:community, 2)
      user.communities << community1

      visit community_path(community1)

      expect(page).to have_content(community1.name)
      expect(page).to have_content(community1.description)
      expect(page).to have_content(user.first_name)
      expect(page).to_not have_content("delete community")
      expect(page).to_not have_content("edit community details")

      visit edit_community_path(community1)
      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end
end
