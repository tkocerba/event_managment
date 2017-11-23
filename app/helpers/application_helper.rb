module ApplicationHelper
  def at_page(page = '') 
    render 'shared/menu', page: page
  end

  def nav_item(title, url, current_page = '')
    content_tag :li, class: "nav-item #{'active' if current_page == title}" do
      link_to title.titleize, url, class: 'nav-link'
    end
  end

  def title(title)
    content_tag(:h2, title.titleize, class: 'mt-5 mb-5')
  end
end
