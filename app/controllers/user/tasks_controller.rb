class User::TasksController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @tasks = Task.where(public: true)
  end

  def show
    @tests = Task.find(params[:id]).tests
  end

end
