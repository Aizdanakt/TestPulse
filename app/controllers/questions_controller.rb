class Admin::QuestionsController < Admin::BaseController
  # before_action :find_test, only: %i[new create]
  # before_action :find_question, only: %i[show destroy update edit]
  #
  # def show; end
  #
  # def new
  #   @question = Question.new
  # end
  #
  # def create
  #   @question = @test.questions.build(question_params)
  #   if @question.save
  #     redirect_to admin_test_path(@test)
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit; end
  #
  # def update
  #   if @question.update(question_params)
  #     redirect_to admin_test_path(@question)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @question.destroy
  #   redirect_to admin_test_path
  # end
end
