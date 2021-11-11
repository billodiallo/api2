class User < ApplicationRecord
has_many :facts
has_secure_password
end
 