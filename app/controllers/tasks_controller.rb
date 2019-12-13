class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @tasks = policy_scope(Task)
  end

  def show
  end

  def new
    @task = Task.new
    @task.user = current_user
  end

  def create
    @task = Task.new(params_task)
    if @task.save!
      redirect_to tasks_path, notice: "Task successfully updated!"
    else
      render :index
    end
  end

  def edit
  end 

  def update
    if @task.update(params_task)
      redirect_to tasks_path, notice: "Task successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: "Task successfully updated!"
    else
      render :edit
    end
  end

  private

  def params_task
    params.permit(:id, :name, :start_date, :end_date, :status, :task_field, :rmk, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end