module Developer::DashboardHelper
  def selected_snippet_id
    session[:selected_snippet_id]
  end

  def selected_snippet_class(snippet)
    # binding.pry
    if selected_snippet_id == snippet.id
      'gist-selected'
    else
      ''
    end
  end
end
