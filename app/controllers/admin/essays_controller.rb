class Admin::EssaysController < Admin::BaseController
  before_action :find_task, only: %i[new create]
  before_action :find_essay, only: %i[show edit update destroy]

  def show; end

  def edit; end

  def new
    @essay = Essay.new
  end

  def destroy
    @essay.destroy
    redirect_to admin_task_essays_path(@essay)
  end

  def create
    @essay = @task.essays.build(essay_params)
    if @essay.save
      redirect_to admin_task_path(@task)
    else
      render :new
    end
  end

  def update
    if @essay.update(essay_params)
      redirect_to admin_task_path(@essay.task)
    else
      render :edit
    end
  end

  private

  def essay_params
    params.require(:essay).permit(:title, :description, :time_limit, :image_url)
  end

  def find_essay
    @essay = Essay.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:task_id])
  end
end
