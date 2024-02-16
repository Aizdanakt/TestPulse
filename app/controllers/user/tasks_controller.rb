class User::TasksController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :extract_tasks, only: %i[index archive result]
  def index
    @end_time = Time.current

    @tasks = @all_tasks.where(public: true).where('end_time >= ?', @end_time)
  end

  def show
    @tests = Task.find(params[:id]).tests
    @essays = Task.find(params[:id]).essays
  end

  def archive
    @current_time = Time.current
    @tasks = @all_tasks.where('end_time <= ?', @current_time)
  end

  def result
    @task = @all_tasks.find(params[:id])
  end

  private

  def extract_tasks
    @all_tasks = Task.all
  end

end
