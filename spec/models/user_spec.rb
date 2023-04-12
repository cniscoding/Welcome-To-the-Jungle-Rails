require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'user is valid if all field is input' do
      @user = User.create(name: 'Jack', email: 'this@email.com', password: 'letmein', password_confirmation: 'letmein')
      expect(@user).to be_valid
    end
    
    it 'fails if password are not the same' do
      @user = User.create(name: 'Jack', email: 'this@email.com', password: 'letmein', password_confirmation: 'dontletmein')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'fails if either password is not input' do
      @user = User.create(name: 'Jack', email: 'this@email.com', password: nil, password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'the emails must be unique and not case sensitive or shows an error' do
      @user = User.create(name: 'Jack', email: 'this@email.com', password: 'letmein', password_confirmation: 'letmein')
      @user2 = User.create(name: 'Amble', email: 'this@email.com', password: 'letmein', password_confirmation: 'letmein')
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'shows an error when name is not input' do
      @user = User.create(name: nil, email: 'this@email.com', password: 'letmein', password_confirmation: 'letmein')
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'shows an error when email is not input' do
      @user = User.create(name: 'Jack', email: nil,  password: 'letmein', password_confirmation: 'letmein')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should fail if password is not a minimum length of 6 characters' do
      @user = User.create(name: 'Jack', email: 'this@email.com',  password: 'fail', password_confirmation: 'fail')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'it log in with correct credentials' do
      @user = User.create(name: 'Jack', email: 'this@email.com', password: "letmein", password_confirmation: "letmein")
      expect(User.authenticate_with_credentials('this@email.com', "letmein")).to_not eq(nil)
    end

    it 'few spaces before and/or after their email address should authenticate successfully' do
      @user = User.create(name: 'Jack', email: 'this@email.com', password: 'letmein', password_confirmation: 'letmein')
      expect(User.authenticate_with_credentials('   this@email.com ', 'letmein')).to_not eq(nil)
    end

    it 'should login with case mismatch' do
      @user = User.create(name: 'Jack', email: 'tHIs@email.com', password: 'letmein', password_confirmation: 'letmein')
      expect(User.authenticate_with_credentials('this@email.com ', 'letmein')).to_not eq(nil)
    end

  end
end
