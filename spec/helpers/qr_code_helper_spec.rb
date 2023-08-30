# frozen_string_literal: true

require 'rails_helper'
require 'support/svg_data'

describe QrCodeHelper, type: :helper do
  context 'with various options' do
    it 'must export to svg' do
      expect(qr_code_as_svg('login_espresso_issuer')).to eq(AS_SVG)
    end
  end
end
