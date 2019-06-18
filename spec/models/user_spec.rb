require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user = User.new({
        :first_name => "Jane",
        :last_name => "Doe",
        :email => "janedoe@domain.net",
        :password => "1234abcd",
        :password_confirmation => "1234abcd"
      })
    end

    it "will save successfully valid attributes" do
      @user.save
      expect(@user.errors.full_messages).to be_empty
    end

    it "will not save if passwords don't match" do
      @user.password = "abcd1234"
      @user.save
      expect(@user).to_not be_valid
    end

    it "will not save without a password" do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "will not save without a password confirmation" do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "will not save without a unique email" do
      @user.email = "test@test.com"
      @user.save
      @user1 = User.new({
        :first_name => "John",
        :last_name => "Doe",
        :email => "test@test.com",
        :password => "1234abcd",
        :password_confirmation => "1234abcd"
      })
      @user1.save
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it "will not save without an email" do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "will not save without a first name" do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "will not save without a last name" do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should have a password of at least 5 characters" do
      @user.password = "111"
      @user.password_confirmation = "111"
      @user.save
      expect(@user).to_not be_valid
    end

  end
end



# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required