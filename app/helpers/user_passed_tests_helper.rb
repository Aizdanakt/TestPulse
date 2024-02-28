module UserPassedTestsHelper

  def views_result(user_passed_test)
    percentage = user_passed_test.success_percentage(user_passed_test)
    color_class = user_passed_test.success?(percentage) ? 'text-success' : 'text-danger'
    "<span class=#{color_class}>#{I18n.t('.percentage')}: #{percentage}% </span>".html_safe
  end

end
