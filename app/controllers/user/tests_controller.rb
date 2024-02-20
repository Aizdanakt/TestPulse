class User::TestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @test = Test.find(params[:id])

    if @test.deadline_passed?
      redirect_to user_task_path(@test.task), error: t('.deadline_error')
    elsif @test.attempts_over?(current_user)
      redirect_to user_task_path(@test.task), error: t('.attempts_error')
    else
      current_user.tests << @test
      redirect_to user_passed_test_path(current_user.user_passed_test(@test))
    end
  end
end
