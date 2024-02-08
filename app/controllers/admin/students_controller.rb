class Admin::StudentsController < Admin::BaseController
  def index
    @students = current_user.students
  end

  def show
    @student = current_user.students.where(id: params[:id]).first
    # @passed_tests = student.user_passed_tests
  end
end
