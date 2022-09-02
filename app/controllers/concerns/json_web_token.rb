require 'jwt'

module JsonWebToken
    extend ActiveSupport::Concern

    SECRET_KEY = Rails.application.credentials.secret_jwt_key

    def jwt_encode(payload, exp=24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end


    def jwt_decode(token)
        body = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new body

    rescue JWT::ExpiredSignature, JWT::VerificationError => e
        raise ExceptionHandler::ExpiredSignature, e.message
    end


    def user_id_in_token?

        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = jwt_decode(header)
            @current_user_id = @decoded[:user_id]
        rescue
            nil
        end
    end

end