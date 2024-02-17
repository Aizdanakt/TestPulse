class UserPassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[show update]

  def show
    puts params[:id].inspect
    puts '_____________________________'
  end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed?

      redirect_to user_task_path(@user_passed_test.test.task), success: 'Ваш тест сохранен'
    else
      redirect_to user_passed_test_path(@user_passed_test)
    end
  end

  private

  def set_user_passed_test
    puts params[:id].inspect
    puts '_____________________________'
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
