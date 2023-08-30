# frozen_string_literal: true

require 'rails_helper'

feature 'User can view account settings' do
  context 'without OTP' do
    let!(:user) { create(:user) }

    scenario 'As a user without OTP, I can enable OTP' do
      login_as(user)

      visit edit_user_registration_path

      expect(page).to have_content('Two factor authentication is NOT enabled.')
      expect(page).to have_link('Enable Two Factor Authentication')
    end

    scenario 'configure OTP with valid code' do
      login_as(user)

      visit new_two_factor_settings_path

      expect(page).to have_content('Scan QR Code')
      expect(page).to have_field('Code')
      expect(page).to have_field('Password')

      fill_in 'Code', with: user.current_otp
      fill_in 'Password', with: 'A1b2c3d4e5f6.'
      click_button 'Confirm and Enable Two Factor'

      expect(page).to have_content('Backup Codes')
      expect(page).to have_content('Two Factor Setup Complete')
      expect(page).to have_link('Return to account settings')
    end

    scenario 'configure OTP with invalid code' do
      login_as(user)

      visit new_two_factor_settings_path

      expect(page).to have_content('Scan QR Code')
      expect(page).to have_field('Code')
      expect(page).to have_field('Password')

      fill_in 'Code', with: 6.times.map{rand(6)}.join
      fill_in 'Password', with: 'A1b2c3d4e5f6.'
      click_button 'Confirm and Enable Two Factor'

      expect(page).to have_content('Incorrect Code')
    end

    scenario 'configure OTP with invalid password' do
      login_as(user)

      visit new_two_factor_settings_path

      expect(page).to have_content('Scan QR Code')
      expect(page).to have_field('Code')
      expect(page).to have_field('Password')

      fill_in 'Code', with: user.current_otp
      fill_in 'Password', with: 'foobar'
      click_button 'Confirm and Enable Two Factor'

      expect(page).to have_content('Incorrect password')
    end

    scenario 'access edit page without OTP' do
      login_as(user)

      visit edit_two_factor_settings_path

      expect(page).to have_content('Please enable two factor authentication first.')
    end
  end

  context 'with OTP' do
    let!(:user) { create(:user, :with_otp) }

    scenario 'can disable OTP' do
      login_as(user)

      visit edit_user_registration_path

      expect(page).to have_content('Two factor authentication is enabled.')
      expect(page).to have_button('Disable Two Factor Authentication')
    end

    scenario 'disable OTP with error' do
      login_as(user)

      allow_any_instance_of(User).to receive(:update!).and_return(false)

      visit edit_user_registration_path

      click_button 'Disable Two Factor Authentication'

      expect(page).to have_content('Could not disable two factor authentication.')
    end

    scenario 'can not access OTP configuration page' do
      login_as(user)

      visit new_two_factor_settings_path

      expect(page).to have_content('Two Factor Authentication is already enabled.')
    end

    scenario 'access edit page for second time' do
      login_as(user)

      allow(user).to receive(:two_factor_backup_codes_generated?).and_return(true)

      visit edit_two_factor_settings_path

      expect(page).to have_content('You have already seen your backup codes.')
    end
  end
end
