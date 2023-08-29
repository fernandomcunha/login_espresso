# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    include AuthenticateWithOtpTwoFactor

    prepend_before_action :check_captcha, only: [:create]
    prepend_before_action :authenticate_with_otp_two_factor,
                          if: -> { action_name == 'create' && otp_two_factor_enabled? }

    protect_from_forgery with: :exception, prepend: true, except: :destroy

    private

    def check_captcha
      return if verify_recaptcha

      self.resource = resource_class.new sign_in_params

      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error)
        render :new
      end
    end
  end
end
