require 'rails_helper'

RSpec.feature "admin tries to edit community" do
  context "with both name and description" do
    scenario "and can successfully edit community" do
      user = create(:user)
      skill1, skill2, skill3 = create_list(:skill, 3)
      user.skills << skill1
      user.skills << skill2
      user.skills << skill3
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      community1, community2 = create_list(:community, 2)
      user.communities << community1
      user.communities << community2
      Admin.create(user: user, community: community1)
      visit community_path(community1)

      expect(page).to have_content("edit community details")
      click_on("edit community details")

      expect(current_path).to eq(edit_community_path(community1))

      fill_in "community[name]", with: "New name"
      fill_in "community[description]", with: "New description"
      click_on "Update Community"
      expect(page).to have_content "New name"
      expect(page).to have_content("New description")
      expect(page).to have_content "Community updated and saved!"
    end
  end

  context "by changing name but deleting desciption" do
    scenario "and sees an error message" do
      user = create(:user)
      skill1, skill2, skill3 = create_list(:skill, 3)
      user.skills << skill1
      user.skills << skill2
      user.skills << skill3
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      community1, community2 = create_list(:community, 2)
      user.communities << community1
      user.communities << community2
      Admin.create(user: user, community: community1)
      visit community_path(community1)

      expect(page).to have_content("edit community details")
      click_on("edit community details")

      expect(current_path).to eq(edit_community_path(community1))
    
      fill_in "community[name]", with: "New name"
      fill_in "community[description]", with: nil
      click_on "Update Community"

      expect(page).to have_content("Update failed")
    end
  end
end
