# frozen_string_literal: true

require 'rails_helper'

feature 'User can disable OTP' do
  context 'with OTP enabled' do
    let!(:user) { create(:user, :with_otp) }

    scenario 'when OTP is enabled' do
      login_as(user)

      visit edit_user_registration_path

      expect(page).to have_content('Two factor authentication is enabled.')
      expect(page).to have_button('Disable Two Factor Authentication')

      click_button('Disable Two Factor Authentication')

      expect(page).to have_content('Two factor authentication is NOT enabled.')
      expect(page).to have_link('Enable Two Factor Authentication')
    end
  end
end
