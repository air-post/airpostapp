module Api
  class ApplicationAPIController < ActionController::Base
    before_action :authenticate_user_from_token!

    def authenticate_user_from_token!
      authenticate_or_request_with_http_token do |token, options|
        user = User.find_by(token: token)
        if user.present?
          # sign_in user
          set_user user
        else
          render_unauthorized
        end
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad credentials', status: 401
    end

    def sign_in(user)
      cookies[:_cc_extra] = {
          :value => Commerceconnect::Common::Utility.encrypt_data(uid: user.uid, sign_in_at: user.sign_in_at),
          :domain => ".#{Settings.domain}"
      }
      session[:user_id] = user.uid
      session[:sign_in_at] = user.sign_in_at
    end

    def set_user(user)
      @user = user
    end
  end
end