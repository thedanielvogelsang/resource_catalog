require 'rails_helper'

RSpec.feature "user navigates in and out of community they administrate" do
  scenario "and their role switches accordingly" do
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
    user.communities << community2 #user belongs to two communities but admins only 1
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_path(user)

    expect(page).to have_content(community.name)
    expect(page).to have_content(community2.name)

    click_link(community.name)
    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
    find("//a.profile-link").click
    expect(page).to have_content(community2.name)

    click_link(community2.name)
    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
