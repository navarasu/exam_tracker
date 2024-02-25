class UsersController < ApplicationController

  before_action :set_user_params, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: 'User was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: 'User was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def destroy
    @user.delete

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :role, :username, :password)
  end
end
