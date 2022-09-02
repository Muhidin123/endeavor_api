class ApplicationController < ActionController::API
    include JsonWebToken

    private


    def authenticate_request
        unless user_id_in_token?
            render json: { errors: ['Not Authenticated'] }, status: :unauthorized
            return
        end
        @current_user = User.find(auth_token[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

end
