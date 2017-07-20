require 'rails_helper'

RSpec.feature "user adds a resource" do
    context "correctly" do
      scenario "and sees it on the screen" do
        visit new_sharable_path
        fill_in "sharable[sharable]", with: "sharable 1"
        click_on "offer a resource!"
        expect(current_path).to eq(sharables_path)
        expect(page).to have_content "sharable 1"
      end
    end
  end
