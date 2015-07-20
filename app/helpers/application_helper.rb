module ApplicationHelper
  def admin_link_to(name, path)
    if current_user
      link_to name, path
    end
  end
end
