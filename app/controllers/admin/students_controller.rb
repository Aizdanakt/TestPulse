class Admin::StudentsController < Admin::BaseController
  before_action :find_student, except: :index

  def index
    @students = current_user.students
  end

  def show; end

  def destroy
    @student.destroy
    redirect_to admin_students_path, success: 'Студент успешно удален'
  end

  def result
    @task = Task.find(params[:task_id])
  end

  private

  def find_student
    @student = current_user.students.find(params[:id])
  end
end
