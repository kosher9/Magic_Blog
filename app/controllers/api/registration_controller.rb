require_relative '../../../app/controllers/concerns/json_web_tokens'
class Api::RegistrationController < ApplicationController
  # skip_before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token
  def create
    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    if params[:email].present? && params[:password].present?
      user.token = TokenAuthorization.jwt_encode(params[:email])
      user.confirmed_at = Time.now
      if user.save
        render json: { message: 'Signed Up!', token: user.token }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'Email and Password are required' }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e }
  end

  def auth
    return unless check_auth?(params[:id])

    user = User.find(params[:id])
    email = user.email
    token = TokenAuthorization.jwt_encode(email)
    user.update(token:)
    render json: { message: 'Authenticated', token: user.token }, status: :ok
  end

  private

  def check_auth?(user_id)
    user = User.where(id: user_id)
    if user.empty?
      render json: { error: 'Unauthorized' }, status: :unauthorized
      return false
    end
    true
  end
end
