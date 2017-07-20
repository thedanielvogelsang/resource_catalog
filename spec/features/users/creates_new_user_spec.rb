require 'rails_helper'

RSpec.feature "User creates new account" do
  context "without filling out all the fields" do
    scenario "and is returned to the new user page" do
      visit new_user_path

      fill_in "First name", with: "Daniel"
      fill_in "Last name", with: "Vogelsang"
      fill_in "Password", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Create User"
      expect(page).to_not have_content("Hello Daniel")
    end
  end
  context "without matching password confirmation" do
    scenario "and is returned to the new user page" do
      visit new_user_path

      fill_in "First name", with: "Daniel"
      fill_in "Last name", with: "Vogelsang"
      fill_in "Address", with: "123 Baxter, Denver, CO"
      fill_in "Zipcode", with: 80216
      fill_in "user[phone]", with: 3162000000
      fill_in "user[email]", with: "example@gmail.com"
      fill_in "Password", with: "password"
      fill_in "user[password_confirmation]", with: "NOTpassword"
      click_on "Create User"
      expect(User.all.empty?).to be_truthy
    end
  end
  context "correctly" do
    scenario "and is taken to the user profile page" do
      visit new_user_path

      fill_in "First name", with: "Daniel"
      fill_in "Last name", with: "Vogelsang"
      fill_in "Address", with: "123 Baxter, Denver, CO"
      fill_in "Zipcode", with: 80216
      fill_in "user[phone]", with: 3162000000
      fill_in "user[email]", with: "example@gmail.com"
      fill_in "Password", with: "thepassword"
      fill_in "user[password_confirmation]", with: "thepassword"
      click_on "Create User"
      expect(page).to have_content("ComRe-Cat")
      save_and_open_page
    end
  end
end
