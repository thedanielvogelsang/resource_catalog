require 'rails_helper'

describe User do
  it "can be created as an admin" do
    user = create(:user, username: "penelope",
                         password: "boom",
                         password_confirmation: "boom",
                         role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = create(:user, username: "sammy",
                         password: "pass",
                         password_confirmation: "pass",
                         role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
