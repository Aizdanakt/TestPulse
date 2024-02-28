class User::TasksController < ApplicationController
  before_action :authenticate_user!, except: :welcome_page
  before_action :extract_tasks

  def index
    @end_time = Time.current

    @tasks = @all_tasks.where(public: true).where('end_time >= ?', @end_time)
  end

  def show
    task = @all_tasks.where(public: true).where('end_time >= ?', Time.current).find(params[:id])
    if task.passed_or_not_started?
      redirect_to root_path
    else
      @tests = task.tests
      @essays = task.essays
    end
  end

  def archive
    @current_time = Time.current
    @tasks = @all_tasks.where('end_time <= ?', @current_time)
  end

  def result
    @task = @all_tasks.find(params[:id])
  end

  def welcome_page; end

  private

  def extract_tasks
    @all_tasks = Task.where(group: current_user&.group)
  end

end
