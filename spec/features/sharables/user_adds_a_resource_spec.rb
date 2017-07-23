require 'rails_helper'

RSpec.feature "user adds a resource" do
    context "correctly" do
      scenario "and sees it on the screen" do
        user = create(:user)
        skill1, skill2, skill3 = create_list(:skill, 3)
        user.skills << skill1
        user.skills << skill2
        user.skills << skill3
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_create_sharables_path(user)
        fill_in "sharable[sharable]", with: "sharable 1"
        click_on "offer a resource!"
        expect(current_path).to eq(user_sharables_path(user))
        expect(page).to have_content "sharable 1"
      end
    end
  end
