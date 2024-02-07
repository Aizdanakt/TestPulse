class Admin::TestsController < Admin::BaseController
  before_action :find_task, only: %i[new create]
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def new
    @test = Test.new
  end

  def destroy
    @test.destroy
    redirect_to admin_task_tests_path(@test)
  end

  def create
    @test = current_user.created_tests.build(test_params)
    @test.task_id = params[:task_id]
    if @test.save
      redirect_to admin_task_path(@task)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_task_path(@test.task)
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time_limit)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:task_id])
  end
end
