class User::TestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @test = Test.find(params[:id])

    if @test.deadline_passed?
      redirect_to user_task_path(@test.task), error: 'Срок для прохождения теста прошел'
    elsif @test.attempts_over?
      redirect_to user_task_path(@test.task), error: 'Ваши попытки закончились'
    else
      current_user.tests << @test
      @test.decrement!(:attempts)
      redirect_to user_passed_test_path(current_user.user_passed_test(@test))
    end
  end
end
