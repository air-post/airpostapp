class PostsController < ApplicationAPIController
	def find
		Rails.logger.info "USer Id query: #{params[:user_id].present?}"
		Rails.logger.info "longitude query: #{params[:longitude].present?}"
		Rails.logger.info "latitude query: #{params[:latitude].present?}"
		Rails.logger.info "distance query: #{params[:distance].present?}"


		if params[:longitude].present? and params[:latitude].present? and params[:distance].present?
			posts = Post.where("select 3961000 * 2 * ASIN(SQRT(POWER(SIN((? - latitude) * pi()/180 / 2), 2) +COS(? * pi()/180) *COS(latitude * pi()/180) *POWER(SIN((? - longitude) * pi()/180 / 2), 2) )) <= ?", params[:latitude], params[:latitude], params[:longitude], params[:distance])
		else
			posts = Post.all
		end
		posts = posts.where('user_id = ?', params[:user_id]) if params[:user_id].present?

		render json: posts
	end

	def create
		post = Post.new(post_params)
		post.user_id = post.user_id || 1
		post.expire_time = post.expire_time || 10.days.from_now

		post.save!
		render json: post
	end

	def post_params
    params.require(:post).permit(:title, :content, :user_id, :latitude, :longitude, :altitude, :accuracy, :altitude_accuracy, :expire_time)
  end
end
