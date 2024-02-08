class User::TestsController < ApplicationController
  before_action :authenticate_user!

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)

    redirect_to user_passed_test_path(current_user.user_passed_test(@test))
  end
end
