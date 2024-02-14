class User::TasksController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :extract_tasks, only: %i[index archive]
  def index
    @end_time = Time.current

    @tasks = @tasks.where(public: true).where('end_time >= ?', @end_time)
  end

  def show
    @tests = Task.find(params[:id]).tests
    @essays = Task.find(params[:id]).essays
  end

  def archive
    @current_time = Time.current
    @tasks = @tasks.where('end_time <= ?', @current_time)
  end

  private

  def extract_tasks
    @tasks = Task.all
  end

end
