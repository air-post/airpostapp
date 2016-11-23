class Post < ApplicationRecord
	default_scope { where("not expired or expired is NULL ")}
	default_scope { where(deleted_at: nil)} 
	scope :of_range, -> (latitude, longitude, distance) { where("select 3961000 * 2 * ASIN(SQRT(POWER(SIN((? - latitude) * pi()/180 / 2), 2) +COS(? * pi()/180) *COS(latitude * pi()/180) *POWER(SIN((? - longitude) * pi()/180 / 2), 2) )) <= ?", latitude, latitude, longitude, distance) if latitude.present? and longitude.present? and distance.present?}
	scope :of_user, -> (user_id) { where(user_id: user_id) if user_id.present? }

	belongs_to :user

	before_validation :set_default

	def set_default
		self.user_id = self.user_id || 1
		self.expire_time = self.expire_time || 10.days.from_now
	end
end
