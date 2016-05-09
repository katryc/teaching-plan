module DeviseHelper
  def devise_error_messages!
  return '' if resource.errors.empty?

  messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
  sentence = I18n.t('errors.messages.not_saved',
  count: resource.errors.count,
  resource: resource.class.model_name.human.downcase)

  # for Bootstrap 3 pay attention to the classes in the "div"

  html = <<-HTML
  <div class="card pink lighten-3">
  <button class="btn-floating btn-large waves-effect waves-light close" aria-hidden="true">&times;</button>
  <h5>#{sentence}</h5>
  #{messages}</div>
  HTML
  html.html_safe
 end
end
