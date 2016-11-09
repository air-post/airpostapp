class PostsController < ActionController::API
	def find
		#query = parse_json_object("query", params[:query], REQUIRED)
		posts = Post.all
		render json: posts
	end
	def create
	end
end
