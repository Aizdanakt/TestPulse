class User::TestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @test = Test.find(params[:id])
    time = Time.current

    if @test.task.end_time <= time || @test.task.start_time <= time
      current_user.tests.push(@test)
      redirect_to user_passed_test_path(current_user.user_passed_test(@test))
    else
      redirect_to user_task_path(@test)
    end
  end
end
