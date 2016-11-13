class Post < ApplicationRecord
	default_scope { where("not expired or expired is NULL ")}
	default_scope { where("deleted_at is NULL ")} 

	belongs_to :user
end
