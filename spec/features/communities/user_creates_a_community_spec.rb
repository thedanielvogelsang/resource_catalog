require 'rails_helper'

RSpec.feature "user creates a new community from their profile page" do
  scenario "and sees the info they entered on a community show page" do
    user = create(:user, username: "username", password: "password", password_confirmation: "password")
    visit ('/')
    expect(page).to have_content('ComRe-Cat')
    expect(page).to have_link('Login')
    expect(page).to have_link('Sign-Up')
    click_link("Login")
    find("#user", :visible => false).set "username"
    find("#password", :visible => false).set "password"
    find(".loginmodal-submit", :visible => false).click
    expect(page).to have_content "Hello #{user.first_name}!"
    expect(page).to have_button "Form a new Community"
    click_button "Form a new Community"
    expect(current_path).to eq(new_community_path)
    expect(page).to have_content("Tell us about your community.")
    expect(page).to have_css("//form")
    fill_in("community[name]") with: "CommunityName"
    fill_in("community[description]") with: "info about this community"
    click_on "Create community"

    expect(page).to have_content "CommunityName"
    expect(page).to have_content "info about this community"
    expect(page).to have_content user.username
    expect(page).to have_content "Posts"
  end
end
