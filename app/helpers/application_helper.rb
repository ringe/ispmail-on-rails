module ApplicationHelper
  def form_error_callout(form_id)
    form_callout = <<-ajax_error
      $('form##{form_id}').bind('ajax:error', function(evt, data, status, xhr){
        $("#messages").html(
          '<div id="flash" class="callout warning">' +
          '<div id="flash_notice">' +
          data.responseJSON.join("<br/>") +
          '</div></div>'
        );
        $('#messages').foundation('open');
      })
    ajax_error
    form_callout.html_safe
  end
end
