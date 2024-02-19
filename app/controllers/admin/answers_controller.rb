class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[edit update destroy show]

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def show; end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to admin_question_path(@answer.question), success: t('.create_answer')
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question), success: t('.update_answer')
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question), success: t('.destroy_answer')
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

end
