class Admin::TasksController < Admin::BaseController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    @tests = @task.tests
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

  private

  def task_params
    params.require(:task).permit(:title)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
