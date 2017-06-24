require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.create(:user) }
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_uniqueness_of(:username)}
  end

  describe 'associations' do
    it {should have_many(:goals)}
  end

  describe 'User methods' do

    describe 'reset_session_token' do
      it 'return the session token' do
        old_token = user.session_token
        expect(user.reset_session_token).not_to eq(old_token)
      end

      describe 'valid_password?' do
        it 'returns true if password is valid' do
          expect(user.valid_password?('password')).to eq(true)
        end
      end

      describe 'password=' do
        it 'sets a user\'s password digest' do
          user.password=('password')
          expect(user.password_digest).not_to eq('password')
        end
      end



    end


    describe 'User::find_by_credentials'do
      it 'finds a user by credentials' do
        username = user.username
        password = "password"
        expect(User.find_by_credentials(username, password)).to eq(user)
      end
    end
  end
end
