class User::EssaysController < ApplicationController
  before_action :authenticate_user!

  def start
    @essay = Essay.find(params[:id])

    if @essay.deadline_passed?
      redirect_to user_task_path(@essay.task), error: t('.deadline_error')
    elsif @essay.attempts_over?(current_user)
      redirect_to user_task_path(@essay.task), error: t('.attempts_error')
    else
      current_user.essays << @essay
      redirect_to user_passed_essay_path(current_user.user_passed_essay(@essay))
    end
  end
end
