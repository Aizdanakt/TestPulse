class User::EssaysController < ApplicationController
  before_action :authenticate_user!

  def start
    @essay = Essay.find(params[:id])
    time = Time.current

    if @essay.task.end_time >= time && @essay.task.start_time <= time
      current_user.essays.push(@essay)
      redirect_to user_passed_essay_path(current_user.user_passed_essay(@essay))
    else
      redirect_to user_task_path(@essay)
    end
  end
end
