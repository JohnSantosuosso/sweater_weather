require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "class methods" do
    it "can generate an auth token" do
      user = User.create(email: "John@gmail.com", password: "password", password_confirmation: "password")
      expect(user.auth_token).to_not be_nil
      expect(user.auth_token).to be_a(String)
      expect(user.auth_token.length).to eq(24)
    end
  end
end