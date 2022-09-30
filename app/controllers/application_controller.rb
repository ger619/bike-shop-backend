class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def decode_token
    # Authorization

    auth_header = request.headers['Authorization']
    return unless auth_header

    token = auth_header.split[1]
    begin
      JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def authorized_user
    decoded_token = decode_token
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authorize
    render json: { message: 'Please log in' }, status: :unauthorized unless authorized_user
  end
end
