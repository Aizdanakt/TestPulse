class Admin::TasksController < Admin::BaseController
  before_action :find_task, only: %i[show edit update destroy make_public make_private]

  def index
    @tasks = Task.all
  end

  def show
    @tests = @task.tests
    puts @tests.inspect
  end

  def edit; end

  def new
    @task = Task.new
  end

  def destroy
    @task.destroy
    redirect_to admin_tasks_path(@task)
  end

  def create
    @task = current_user.created_tasks.build(task_params)
    if @task.save
      redirect_to admin_tasks_path
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to admin_tasks_path(@task)
    else
      render :edit
    end
  end

  def make_public
    @task.update(public: true)
    redirect_to admin_tasks_path
  end

  def make_private
    @task.update(public: false)
    redirect_to admin_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :start_time, :end_time)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
