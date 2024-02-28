class UserPassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_passed_test, only: %i[show update]

  def show; end

  def update
    @user_passed_test.accept!(params[:answer_ids]) unless @user_passed_test.completed

    if @user_passed_test.completed?


      redirect_to user_task_path(@user_passed_test.test.task), success: t('.success_save')
    else
      redirect_to user_passed_test_path(@user_passed_test)
    end
  end

  private

  def set_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
