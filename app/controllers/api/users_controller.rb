module Api
	class UsersController < ApplicationAPIController
		skip_before_action :authenticate_user_from_token!, only: [:login]

		def index
			if params[:id].present?
				user = User.find(params[:id])
			else
				user = @user
			end
			render json: user
		end

		def create
			user = User.new(user_params)
			user.save!
			render json: user
		end

		def login
			user = User.of_name(params[:user_name]).of_type(params[:user_type]).first
			if user.nil? && params[:force_create] == 'true'
				user = User.new(user_params)
				user.save!
			else
				user = {} unless user.authenticate(params[:password])
			end
			render json: user
		end

		def token
			user = User.of_name(params[:user_name]).of_type(params[:user_type]).first
			token = user.token if user.present?
			render json: {:token => token||''}
		end

		private

		def user_params
	    	params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :user_type)
	  end
	end
end