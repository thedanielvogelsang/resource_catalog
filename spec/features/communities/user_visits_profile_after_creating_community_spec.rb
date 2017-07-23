require 'rails_helper'
RSpec.feature "user creates a new community from their profile page" do
  scenario "and sees the info they entered on a community show page" do
    user = create(:user, username: "username", password: "password", password_confirmation: "password")
    skill1, skill2, skill3 = create_list(:skill, 3)
    user.skills << skill1
    user.skills << skill2
    user.skills << skill3
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_user_community_path(user)
    fill_in "community[name]", with: "CommunityName"
    fill_in "community[description]", with: "info about this community"
    click_on "Create Community"
    find("//a.profile-link").click
    expect(page).to have_content("Hello #{user.first_name}!")
    expect(page).to have_content("CommunityName")
  end
end
