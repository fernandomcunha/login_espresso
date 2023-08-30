# frozen_string_literal: true

require 'rails_helper'

describe EmailValidator do
  let(:user) { build(:user, email:) }
  let(:validator) { described_class.new(attributes: [:email]) }

  subject { validator.validate(user) }

  context 'valid email' do
    let(:email) { 'test@example.com' }

    it 'should be valid' do
      expect { subject }.to_not(change { user.errors.count })
      expect(user.errors[:email]).to be_blank
    end
  end

  context 'ivalid email' do
    let(:email) { 'invalid.email' }

    it 'should be invalid' do
      expect { subject }.to(change { user.errors.count })
      expect(user.errors[:email]).to be_present
      expect(user.errors[:email].join(' ')).to include('has an invalid format')
    end
  end
end
