class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = get_task
    @plans = @task.plans
  end

  def create
    @task = Task.new(task_params)

    # set current_user
    @task.user = current_user

    if @task.save
      flash[:success] = "仕事を追加しました。"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = get_task
  end

  def update
    @task = get_task

    @task.update_attributes(task_params)

    if @task.save
      flash[:success] = "仕事を更新しました。"
      redirect_to tasks_path
    else
      render "edit"
    end

  end

  def destroy
    @task = get_task
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :end_date)
  end

  def get_task
    Task.find_by(id: params[:id])
  end
end
