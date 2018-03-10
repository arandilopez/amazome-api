class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:show, :update, :destroy]
  only_allow :admin, to: [:index, :create, :update, :destroy, :show]
  # GET /users
  def index
    @users = User.all

    render json: @users, except: json_excepts
  end

  # GET /users/1
  def show
    render json: @user, except: json_excepts
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user, except: json_excepts
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, except: json_excepts
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def current
    @user = current_user

    render json: @user, except: json_excepts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def json_excepts
      [:password_digest]
    end

end
