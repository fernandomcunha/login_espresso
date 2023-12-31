# frozen_string_literal: true

class EmailValidator < ActiveModel::Validator
  def validate(record)
    return if record.email.match? URI::MailTo::EMAIL_REGEXP

    record.errors.add(:email, 'has an invalid format')
  end
end
