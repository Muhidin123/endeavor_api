class User < ApplicationRecord

    require 'securerandom'

    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
    validates :username, presence: true, uniqueness: true
end
