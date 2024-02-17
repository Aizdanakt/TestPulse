class User::EssaysController < ApplicationController
  before_action :authenticate_user!

  def start
    @essay = Essay.find(params[:id])

    if @essay.deadline_passed?
      redirect_to user_task_path(@essay.task), error: 'Срок для прохождения эссе прошел'
    elsif @essay.attempts_over?
      redirect_to user_task_path(@essay.task), error: 'Ваши попытки закончились'
    else
      current_user.essays << @essay
      @essay.decrement!(:attempts)
      redirect_to user_passed_essay_path(current_user.user_passed_essay(@essay))
    end
  end
end
