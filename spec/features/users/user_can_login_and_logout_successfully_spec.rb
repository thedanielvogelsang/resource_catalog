require 'rails_helper'

RSpec.feature "user visits welcome page" do
  context "and logs in with real credentials" do
    scenario "and is taken to their own profile page" do
      user = create(:user, username: "username", password: "password", password_confirmation: "password")
      visit('/')
      click_link("Login")
      find("#user", :visible => false).set "username"
      find("#password", :visible => false).set "password"
      find(".loginmodal-submit", :visible => false).click
      expect(page).to have_content "Hello #{user.first_name}!"
    end
  end

  context "and logs in then logs out" do
    scenario "and is taken back to the home welcome screen" do
      user = create(:user, username: "username", password: "password", password_confirmation: "password")
      visit('/')
      click_link("Login")
      find("#user", :visible => false).set "username"
      find("#password", :visible => false).set "password"
      find(".loginmodal-submit", :visible => false).click
      expect(page).to have_content "Hello #{user.first_name}!"
      click_link("Logout")
      refute page.has_content?("Hello #{user.first_name}!")
      expect(page).to have_content("ComRe-Cat")
    end
  end
end
