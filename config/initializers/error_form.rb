ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag =~ /<input|<textarea/
      error_message = instance.error_message.respond_to?(:join) ? instance.error_message.join(',') : instance.error_message

     %(#{html_tag}<span class="help-inline" style="color:red">&nbsp;
      #{error_message}</span>).html_safe
    else
       html_tag
    end
end
