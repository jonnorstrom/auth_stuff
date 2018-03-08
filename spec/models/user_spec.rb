require "rails_helper"

RSpec.describe User, :type => :model do
  context "making a new user" do
    it "doesn't make a user without a username" do
      user = User.new(password: "password")
      user.save
      expect(user.id).to be_nil
    end
  end
end
