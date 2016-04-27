module Developer::SnippetsHelper
  def star_icon(snippet)
    current_user.star?(snippet.id) ? 'fa-star' : 'fa-star-o'
  end

  def selected_sidebar_class(search_mode)
    # binding.pry
    mode = params[:mode] || session[:search_mode] || 'all'
    search_mode == mode ? 'sidebar-selected' : ''
  end
end
