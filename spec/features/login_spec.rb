# frozen_string_literal: true

require 'rails_helper'

feature 'User log in' do
  context 'user without OTP enabled' do
    let!(:user) { create(:user) }

    scenario 'user without OTP' do
      visit root_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'A1b2c3d4e5f6.'
      click_button 'Log in'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are currently logged in as #{user.email}.")
    end
  end

  context 'user with OTP enabled' do
    let!(:user) { create(:user, :with_otp) }

    scenario 'unknown credentials' do
      visit root_path

      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'foobar'
      click_button 'Log in'

      expect(page).to have_content('Invalid Email or password.')
    end

    scenario 'invalid OTP code' do
      visit root_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'A1b2c3d4e5f6.'
      click_button 'Log in'

      fill_in 'Otp attempt', with: 'invalid-otp'
      click_button 'Log in'

      expect(page).to have_content('Invalid two-factor code.')
    end

    scenario 'can login when providing a valid OTP' do
      visit root_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'A1b2c3d4e5f6.'
      click_button 'Log in'

      fill_in 'Otp attempt', with: user.current_otp
      click_button 'Log in'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are currently logged in as #{user.email}.")
    end
  end
end
