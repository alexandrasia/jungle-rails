require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  # SETUP
  before :each do

    @user = User.create!(
      first_name: 'First_name',
      last_name: 'Last_name',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
      )
    end

  scenario "They can login and are taken to the home page" do
    # ACT
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end

    # DEBUG
    save_screenshot
    # VERIFY
    expect(page).to have_content "Hi, #{@user.first_name}"
  end

end
