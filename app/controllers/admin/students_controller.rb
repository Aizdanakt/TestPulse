class Admin::StudentsController < Admin::BaseController
  before_action :find_students

  def index; end

  def show
    @student = @students.where(id: params[:id]).first
  end

  def destroy
    student = @students.find(params[:id])
    student.destroy
    redirect_to admin_students_path
  end

  private

  def find_students
    @students = current_user.students
  end
end
