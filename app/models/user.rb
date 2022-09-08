class User < ApplicationRecord

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

    require 'securerandom'

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: false


    def jwt_payload
      super
    end
end
