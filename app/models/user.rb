class User < ApplicationRecord
    has_many :message
    has_secure_password
end
