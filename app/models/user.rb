class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
    validates :password_confirmation, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

#   def password
#     @password ||= Password.new(password_hash)
#   end

#   def password=(new_password)
#     @password = Password.create(new_password)
#     @password_hash = @password
#   end
end