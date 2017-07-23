require 'rails_helper'

RSpec.feature "admin tries to delete community" do
  scenario "and can successfully delete community" do
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

    expect(page).to have_content("delete community")
    click_on("delete community")
    within(".loginmodal-container", :visible => false) do
      page {should have_text("Are you sure you want to delete") }
    end
    find("input#delete-confirmation", :visible => false).click
    expect(current_path).to eq(user_path(user))
    expect(page).to_not have_content(community1.name)
    expect(page).to have_content(community2.name)
  end
end
