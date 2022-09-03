require 'pry'

class Api::V1::AuthenticationController < ApplicationController
    # POST /api/v1/authenticate

    skip_before_action :authenticate_request


    def login
        
        # binding.pry
        
        @user = User.find_by(email: params[:email])
        binding.pry
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                           username: @user.username }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
end