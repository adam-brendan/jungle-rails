class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create, confirmation: true, length: { minimum: 5 }
    validates :password_confirmation, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end