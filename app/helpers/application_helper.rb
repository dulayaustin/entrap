module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? "current" : ""
  end

  def page_title(arr)
    app_title = ["Entrap FightGear"]
    title = arr
    title += app_title
    content_for(:title, title.join(" | "))
  end

  def first_name(name)
    first = name.split.first
    first
  end
end
