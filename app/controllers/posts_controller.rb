class PostsController < ApplicationAPIController
	def index
		Rails.logger.info "USer Id query: #{params[:user_id].present?}"
		Rails.logger.info "longitude query: #{params[:longitude].present?}"
		Rails.logger.info "latitude query: #{params[:latitude].present?}"
		Rails.logger.info "distance query: #{params[:distance].present?}"
		posts = Post.of_user(params[:user_id]).of_range(params[:latitude], params[:longitude], params[:distance])
		# if params[:longitude].present? and params[:latitude].present? and params[:distance].present?
		# 	posts = Post.where("select 3961000 * 2 * ASIN(SQRT(POWER(SIN((? - latitude) * pi()/180 / 2), 2) +COS(? * pi()/180) *COS(latitude * pi()/180) *POWER(SIN((? - longitude) * pi()/180 / 2), 2) )) <= ?", params[:latitude], params[:latitude], params[:longitude], params[:distance])
		# end
		#posts = posts.where('user_id = ?', params[:user_id]) if params[:user_id].present?
		result = {}
		if params[:count].present? and params[:count] == "true"
			result[:data] = {'count': posts.count} 
		else
			result = posts
		end

		render json: result
	end

	def find
		render json: Post.find(params[:post_id])
	end

	def create
		post = Post.new(post_params)

		post.save!
		render json: post
	end

	def post_params
    	params.require(:post).permit(:title, :content, :user_id, :latitude, :longitude, :altitude, :accuracy, :altitude_accuracy, :expire_time)
  	end
end
