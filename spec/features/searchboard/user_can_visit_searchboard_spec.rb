require 'rails_helper'

RSpec.feature "user can visit dashboard" do
  context "and, based off their own community's network" do
    scenario "sees a search dropdown and a list of skills available to them" do
      user1 = create(:user, username: "DVOG", first_name: "daniel")
      user2 = create(:user, username: "penny-lynn", first_name: "penny")
      community = create(:community, name: "GroupthinkEarth")
      user1.communities << community
      user2.communities << community
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit("users/#{user1.id}/searchboard")
      expect(page).to have_css("")
      expect(page).to have_content(user2.skills.first)
      expect(page).to have_content(user2.skills.last)
    end
  end
end
