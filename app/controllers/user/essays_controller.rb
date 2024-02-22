class User::EssaysController < ApplicationController
  before_action :authenticate_user!

  def start
    @essay = Essay.find(params[:id])

    if @essay.task.passed_or_not_started?
      redirect_to user_task_path(@essay.task), error: t('.deadline_error')
    elsif @essay.task.attempts_over?(current_user, @essay.user_passed_essays, @essay.attempts)
      redirect_to user_task_path(@essay.task), error: t('.attempts_error')
    else
      current_user.essays << @essay
      redirect_to user_passed_essay_path(current_user.user_passed_essay(@essay))
    end
  end
end
