require 'bcrypt'

class User < ActiveRecord::Base
    include BCrypt
    attr_accessor :password
    validates :email, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    @password_hash = @password
  end
end