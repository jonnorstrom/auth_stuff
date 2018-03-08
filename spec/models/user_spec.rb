require "rails_helper"

RSpec.describe User, :type => :model do
  context "when making a new user:" do
    it "doesn't make a user without a username" do
      user = User.new(password: "password")
      user.save
      expect(user.id).to be_nil
    end

    it "secures our password as it saves" do
      user = User.new(username: "jonjon", password: "password")
      user.save
      expect(user.password_digest).not_to eq('password')
    end

    xit "validates correct password characters" do
      user = User.new(username: "jonjon", password: "password")
      other_user = User.new(username: "jonjon", password: "password1")
      another_user = User.new(username: "jonjon", password: "Password1")
      user.save
      other_user.save
      another_user.save

      expect(user.id).to be_nil
      expect(other_user.id).to be_nil
      expect(other_user.id).not_to be_nil
    end
  end
end
