module ApplicationHelper
  def flash_message
    notification = ''
    [:success, :info, :warning, :error].each do |type|
      if flash[type]
        notification += "<script>notification('#{type}', '#{flash[type]}');</script>"
      end
    end
    notification.html_safe
  end
end
