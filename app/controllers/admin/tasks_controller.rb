class Admin::TasksController < Admin::BaseController
  before_action :find_task, only: %i[show edit update destroy make_public make_private]
  before_action :extract_tasks, only: %i[index archive]

  def index
    @tasks = @tasks.where('end_time >= ?', @current_time)
  end

  def show
    @tests = @task.tests
    @essays = @task.essays
  end

  def edit; end

  def new
    @task = Task.new
  end

  def destroy
    @task.destroy
    redirect_to admin_tasks_path, success: 'Задание успешно удалено'
  end

  def create
    @task = current_user.created_tasks.build(task_params)
    if @task.save
      redirect_to admin_tasks_path, success: 'Задание успешно создано'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to admin_tasks_path(@task), success: 'Задание успешно обновлено'
    else
      render :edit
    end
  end

  def make_public
    @task.update(public: true)
    redirect_to admin_tasks_path, notice: 'Теперь задание доступно студентам'
  end

  def make_private
    @task.update(public: false)
    redirect_to admin_tasks_path, notice: 'Теперь задание недоступно студентам'
  end

  def archive
    @tasks = @tasks.where('end_time <= ?', @current_time)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :group, :start_time, :end_time)
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def extract_tasks
    @current_time = Time.current
    @tasks = Task.all
  end
end
