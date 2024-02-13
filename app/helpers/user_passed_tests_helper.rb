module UserPassedTestsHelper

  def views_result(user_passed_test)
    percentage = user_passed_test.success_percentage(user_passed_test)
    color_class = user_passed_test.success?(percentage) ? 'text-success' : 'text-danger'
    "<h3>#{I18n.t(".percentage")}:<span class=#{color_class}> #{percentage}% </span></h3>".html_safe
  end

end
