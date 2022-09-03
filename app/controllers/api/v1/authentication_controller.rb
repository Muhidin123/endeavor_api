class AuthenticationController
    # POST /api/v1/authenticate

    skip_before_action :authenticate_request


    def login
        @user = User.find_by(params[:email])
        if @user&.authenticate(params[:password])
            token = jwt_encode.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                           username: @user.username }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end
end