class User::TasksController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :extract_tasks, only: %i[index archive result show]

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @end_time = Time.current

    @tasks = @all_tasks.where(public: true).where('end_time >= ?', @end_time)
  end

  def show
    tasks_data = @all_tasks.where('end_time >= ?', Time.current).find(params[:id])

    @tests = tasks_data.tests
    @essays = tasks_data.essays
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
    @all_tasks = Task.where(group: current_user&.group)
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

end
