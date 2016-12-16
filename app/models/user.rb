# "user_name"
# "email"
# "password"
# "disabled_at"
# "created_at"
# "updated_at"
# "user_type"
# "token"
class User < ApplicationRecord
	has_secure_token
	has_secure_password
	default_scope { where(disabled_at: nil)} 
	scope :of_id, -> (id) { where(id: id) }
	scope :of_name, -> (user_name) { where(user_name: user_name) }
	scope :of_type, -> (user_type) { where(user_name: user_type) }

	has_many :posts

	enum user_type: [:system, :device, :facebook, :google]

end
