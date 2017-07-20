require 'rails_helper'

RSpec.feature "user visits welcome page and clicks 'sign up!'" do
  scenario "and is taken to a create_new_user page with new_user form" do
    visit ('/')
    expect(page).to have_content('ComRe-Cat')
    expect(page).to have_link('Login')
    expect(page).to have_link('Sign-Up')
    click_on("Sign-Up")
    expect(current_path).to eq("/users/new")
    expect(page).to have_content("Address, City, State")
  end
end
