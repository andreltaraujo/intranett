class Backoffice::UsersController < ApplicationController

before_action :authenticate_user!
before_action :set_user, except: [:new, :create]

  def index
    @users = User.all
    end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to welcome_index_path, notice: "user #{@user.name} successfuly created!"
    else
      render :new, notice: @user.errors
    end
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to welcome_index_path, notice: "user #{@user.name} successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to backoffice_users_path, notice: "user #{@user.name} successfuly removed!"
    else
      render :index
    end
  end

  private

  def params_user
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :role,
      tasks_attributes:[:id, :name, :start_date, :end_date, :status, :task_field, :rmk])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end