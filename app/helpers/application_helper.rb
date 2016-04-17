module ApplicationHelper
  def form_error_callout(form_id)
    form_callout = <<-ajax_error
      $('form##{form_id}').bind('ajax:error', function(evt, data, status, xhr){
        $("#messages").html(
          '#{flash_messages('data.responseJSON.join("<br/>")', true, true)}'
        );
        $('#messages').foundation('open');
      })
    ajax_error
    form_callout.html_safe
  end

  # Render HTML flash messages callout
  def flash_messages(text, warning=false, javascript=false)
    html = <<-messages
      <div id="flash" class="callout #{warning ? 'warning' : 'secondary' }" data-closable>
        REPLACEME
        <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    messages
    if javascript
      js = html.split("\n").map(&:strip).join("'+'")
      return js.sub(/'REPLACEME'/, text)
    else
      html.sub!(/REPLACEME/, text)
      return html.html_safe
    end
    html.html_safe
  end
end
