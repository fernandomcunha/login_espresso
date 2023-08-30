# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe '.generate_two_factor_secret_if_missing!' do
    subject { user.generate_two_factor_secret_if_missing! }

    context 'when otp_secret is set' do
      let!(:user) { create(:user, :with_otp) }

      it { is_expected.to eq(nil) }
    end

    context 'when otp_secret is not set' do
      let!(:user) { create(:user) }

      it 'must set otp_secret' do
        expect(subject).to be_truthy
        expect(user.otp_secret).not_to be_nil
      end
    end
  end

  describe '.enable_two_factor!' do
    let!(:user) { create(:user) }

    subject { user.enable_two_factor! }

    it 'must set otp_required_for_login to true' do
      expect(subject).to be_truthy
      expect(user.otp_required_for_login).to be_truthy
    end
  end

  describe '.disable_two_factor!' do
    let!(:user) { create(:user, :with_otp) }

    subject { user.disable_two_factor! }

    it 'must unset OTP attributes' do
      expect(subject).to be_truthy
      expect(user.otp_required_for_login).to be_falsey
      expect(user.otp_secret).to be_nil
      expect(user.otp_backup_codes).to be_nil
    end
  end

  describe '.two_factor_qr_code_uri' do
    let!(:user) { create(:user) }

    subject { user.two_factor_qr_code_uri }

    it { is_expected.to include(user.email.gsub('@', '%40')) }
    it { is_expected.to include(ENV.fetch('OTP_2FA_ISSUER_NAME', nil)) }
  end

  describe '.two_factor_backup_codes_generated?' do
    let!(:user) { create(:user) }

    subject { user.two_factor_backup_codes_generated? }

    it { is_expected.to be_falsey }
  end
end
