require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should be valid if password, password_confirmation, email, first_name, and last_name are present' do
      user = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      expect(user).to(be_valid)
    end

    it 'should not be valid if password is missing' do
      user = User.new(password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      expect(user).to_not(be_valid)
    end

    it 'should not be valid if password_confirmation is missing' do
      user = User.new(password: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      expect(user).to_not(be_valid)
    end

    it 'should not be valid if email is missing' do
      user = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', first_name: 'a', last_name: 'a')
      expect(user).to_not(be_valid)
    end

    it 'should not be valid if first_name is missing' do
      user = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', last_name: 'a')
      expect(user).to_not(be_valid)
    end

    it 'should not be valid if last_name is missing' do
      user = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a')
      expect(user).to_not(be_valid)
    end

    it 'should not have different password and password_confirmation' do
      user = User.new(password: 'aaaaaa', password_confirmation: 'bbbbbb')
      expect(user).to_not(be_valid)
    end

    it 'should be invalid when email already exists' do
      user_1 = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'test@test', first_name: 'a', last_name: 'a')
      user_2 = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'test@test', first_name: 'a', last_name: 'a')
      expect(user_2).to_not(be_valid)
    end

    it 'should be invalid when email already exists - case sensitive' do
      user_1 = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'test@test', first_name: 'a', last_name: 'a')
      user_2 = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'TEST@TEST', first_name: 'a', last_name: 'a')
      expect(user_2).to_not(be_valid)
    end

    it 'should have a password at least 6 characters long' do
      user = User.new(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      expect(user).to(be_valid)
    end

    it 'should be invalid if the password is less than 6 characters long' do
      user = User.new(password: 'aaaaa', password_confirmation: 'aaaaa', email: 'a', first_name: 'a', last_name: 'a')
      expect(user).to_not(be_valid)
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should be valid if email and password match' do
      user = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      user_login = User.authenticate_with_credentials('a', 'aaaaaa')
      expect(user_login).to eq(user)
    end

    it 'should be invalid if password does not match' do
      user = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      user_login = User.authenticate_with_credentials('a', 'aaa123aaa')
      expect(user_login).to_not eq(user)
    end

    it 'should be invalid if email does not match' do
      user = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      user_login = User.authenticate_with_credentials('a123', 'aaaaaa')
      expect(user_login).to_not eq(user)
    end

    it 'should be valid if user adds extra spaces before/after email' do
      user = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      user_login = User.authenticate_with_credentials('  a  ', 'aaaaaa')
      expect(user_login).to eq(user)
    end

    it 'should be valid if user types in wrong case for their email' do
      user = User.create(password: 'aaaaaa', password_confirmation: 'aaaaaa', email: 'a', first_name: 'a', last_name: 'a')
      user_login = User.authenticate_with_credentials('A', 'aaaaaa')
      expect(user_login).to eq(user)
    end
  end
end
