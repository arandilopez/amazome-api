class RegisterController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      token = auth_token(@user)
      render json: {jwt: token}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def auth_token(user)
    if user.respond_to? :to_token_payload
      Knock::AuthToken.new payload: user.to_token_payload
    else
      Knock::AuthToken.new payload: { sub: user.id }
    end
  end
end
