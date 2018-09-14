class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new; end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy; end
end
