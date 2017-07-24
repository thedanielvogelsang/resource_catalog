require 'rails_helper'

RSpec.feature "user visits welcome page" do
  context "and logs in with real credentials" do
    scenario "and is taken to their own profile page" do
      user = create(:user, username: "username", password: "password", password_confirmation: "password")
      skill1, skill2, skill3 = create_list(:skill, 3)
      user.skills << skill1
      user.skills << skill2
      user.skills << skill3
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
      skill1, skill2, skill3 = create_list(:skill, 3)
      user.skills << skill1
      user.skills << skill2
      user.skills << skill3
      visit('/')
      click_link("Login")
      find("#user", :visible => false).set "username"
      find("#password", :visible => false).set "password"
      find(".loginmodal-submit", :visible => false).click
      expect(page).to have_content "Hello #{user.first_name}!"
      within("//li.logout") do
        click_link "Logout"
      end
      refute page.has_content?("Hello #{user.first_name}!")
      expect(page).to have_content("ComreCat")
    end
  end
end
