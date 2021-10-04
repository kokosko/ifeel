# frozen_string_literal: true

module Validations
  def validate_text(text, min_length = nil, max_length = nil)
    raise ArgumentError, 'Can\'t be blank' if text&.empty?
    raise ArgumentError, "Length must not be less then #{min_length}" if min_length && text.size < min_length
    raise ArgumentError, "Length must not be more then #{max_length}" if max_length && text.size > max_length
  end

  def valid_brackets?(text)
    return true if text.empty?

    new = text.gsub(/<>|\{\}|\[\]|\(\)/, '')
    return false if new == text

    valid_brackets?(new)
  end
end

class User
  include Validations

  MIN_PASSWORD_LENGTH = 8

  attr_reader :username, :password

  def initialize(username, password)
    validate_text(username)
    validate_text(password, MIN_PASSWORD_LENGTH)
    @username = username
    @password = password
  end

  def username=(username)
    validate_text(username)
    @username = username
  end

  def password=(password)
    validate_text(password, MIN_PASSWORD_LENGTH)
    @password = password
  end
end

class Message
  include Validations

  MAX_LENGTH = 280
  MIN_LENGTH = 0

  attr_reader :text

  def initialize(text)
    validate_text(text, MIN_LENGTH, MAX_LENGTH)
    @text = text
  end

  def text=(text)
    validate_text(text, MIN_LENGTH, MAX_LENGTH)
    @text = text
  end
end

