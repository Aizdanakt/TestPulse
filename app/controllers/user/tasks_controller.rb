class User::TasksController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @end_time = Time.current

    @tasks = Task.where(public: true).where('end_time >= ?', @end_time)
  end

  def show

    @tests = Task.find(params[:id]).tests
  end

end
