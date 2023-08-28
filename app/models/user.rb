# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :secure_validatable, :timeoutable, :password_archivable
end
