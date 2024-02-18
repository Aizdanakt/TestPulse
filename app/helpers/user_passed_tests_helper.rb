module UserPassedTestsHelper

  def views_result(user_passed_test)
    percentage = user_passed_test.success_percentage(user_passed_test)
    color_class = user_passed_test.success?(percentage) ? 'text-success' : 'text-danger'
    "<span class=#{color_class}>Успешность: #{percentage}% </span>".html_safe
  end

end
