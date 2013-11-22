module ApplicationHelper
  def mark_down(string)
    BlueCloth.new(string).to_html.html_safe
  end

  def steps(arg)
    if arg.is_a? Array
      "badge-success" if arg.include? request.path
    else
      "badge-success" if arg == request.path
    end
  end

  def is_mine?(job)
    current_user && current_user.id == job.user_id
  end
end
