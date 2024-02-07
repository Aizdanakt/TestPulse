class User::TasksController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
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
    redirect_to admin_tests_path(@test)
  end

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
