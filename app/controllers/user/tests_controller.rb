class User::TestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @test = Test.find(params[:id])

    if @test.task.passed_or_not_started?
      redirect_to user_task_path(@test.task), error: t('.deadline_error')
    elsif @test.task.attempts_over?(current_user, @test.user_passed_tests, @test.attempts)
      redirect_to user_task_path(@test.task), error: t('.attempts_error')
    else
      current_user.tests << @test
      redirect_to user_passed_test_path(current_user.user_passed_test(@test))
    end
  end
end
