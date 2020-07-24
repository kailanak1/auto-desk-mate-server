class User < ApplicationRecord
    has_many :courses 
    has_secure_password
end
