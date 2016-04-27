module Developer::SnippetsHelper
  def star_icon(snippet)
    current_user.star?(snippet.id) ? 'fa-star' : 'fa-star-o'
  end
end
