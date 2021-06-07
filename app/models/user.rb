class User < ApplicationRecord
  AUTH_FIELD = 'empoid'
  has_secure_password validations: false
end
