class PostsController < ActionController::API
	def find
		#query = parse_json_object("query", params[:query], REQUIRED)
		posts = Post.all
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
