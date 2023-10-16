module ApplicationHelper
  def render_icon(icon, classes: nil)
    classes ||= ""
    render "icons/#{icon}", classes: classes
  end
end
