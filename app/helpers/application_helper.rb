# frozen_string_literal: true

module ApplicationHelper
  INFO = 'alert alert-info'
  SUCCESS = 'alert alert-success'
  DANGER = 'alert alert-danger'

  def flash_class(level)
    case level.to_sym
    when :notice then INFO
    when :success then SUCCESS
    when :error, :alert, :recaptcha_error then DANGER
    end
  end
end
