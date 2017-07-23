require 'rails_helper'

RSpec.feature "user visits community from profile" do
  scenario "successfully" do
    user = create(:user)
    skill1, skill2, skill3 = create_list(:skill, 3)
    sharable1, sharable2 = create_list(:sharable, 2)
    user.skills << skill1
    user.skills << skill2
    user.skills << skill3
    user.sharables << sharable1
    user.sharables << sharable2
    community = create(:community)
    user.communities << community
    Admin.create(user: user, community: community)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_path(user)
  
    expect(page).to have_link("#{community.name}")
    click_link("#{community.name}")

    expect(current_path).to eq(community_path(community))
    expect(page).to have_content(community.description)
  end
end
