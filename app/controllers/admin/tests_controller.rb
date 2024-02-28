class Admin::TestsController < Admin::BaseController
  before_action :find_task, only: %i[new create]
  before_action :find_test, only: %i[show edit update destroy]

  def show
    @questions = @test.questions
  end

  def edit; end

  def new
    @test = Test.new
  end

  def destroy
    @test.destroy
    redirect_to admin_task_tests_path(@test), success: t('.destroy_test')
  end

  def create
    @test = @task.tests.build(test_params)
    if @test.save
      redirect_to admin_task_path(@task), success: t('.create_test')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_task_path(@test.task), success: t('.update_test')
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :time_limit, :image_url, :attempts)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:task_id])
  end
end
