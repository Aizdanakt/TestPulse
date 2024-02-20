class UserPassedEssaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_passed_essay, only: %i[show update]

  def show; end

  def update
    if @user_passed_essay.completed
      redirect_to user_task_path(@user_passed_essay.essay.task), error: t('.error_completed')
    else

      @user_passed_essay.update(answer: params[:answer], completed: true)

      if @user_passed_essay.save!
        redirect_to user_task_path(@user_passed_essay.essay.task), success: t('.success_save')
      else
        redirect_to user_passed_essay_path(@user_passed_essay), error: t('.error_save')
      end
    end
  end

  private

  def set_user_passed_essay
    @user_passed_essay = UserPassedEssay.find(params[:id])
  end
end
