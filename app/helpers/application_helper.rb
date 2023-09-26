module ApplicationHelper
    def full_title(page_title = "")
    base_title = "todo"
    if page_title.empty?
      p base_title
    else
      p "#{page_title} | #{base_title}"
    end
  end
end
