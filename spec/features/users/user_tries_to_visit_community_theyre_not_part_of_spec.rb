require 'rails_helper'

RSpec.feature "user tries to visit community they arent member to" do
  scenario "and are denied access" do
    user = create(:user)
    skill1, skill2, skill3 = create_list(:skill, 3)
    sharable1, sharable2 = create_list(:sharable, 2)
    user.skills << skill1
    user.skills << skill2
    user.skills << skill3
    user.sharables << sharable1
    user.sharables << sharable2
    community = create(:community)
    community2 = create(:community, name: "community2")
    user.communities << community
    Admin.create(user: user, community: community)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_path(user)

    expect(page).to have_content(community.name)

    visit community_path(community2)
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
