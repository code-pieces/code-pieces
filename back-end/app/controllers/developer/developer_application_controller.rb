class Developer::DeveloperApplicationController < ApplicationController
  layout 'developer'
  before_action :current_user_snippets, :require_login
  # helper_method :selected_snippet

  def current_user_snippets
    search_mode = params[:mode] || session[:search_mode] || 'all'
    session[:search_mode] = search_mode

    case search_mode
    when 'starred'
      @snippets = current_user.star_snippets.updated_order
    when 'owned'
      @snippets= current_user.snippets.updated_order
    else
      @snippets = Snippet.all.updated_order
    end
  end

  # def selected_snippet(snippet)
  #   @selected_snippet_id = snippet.id
  #   binding.pry
  #   session[:selected_snippet_id] = snippet.id
  # end

  # def selected_snippet
  #   @selected_snippet_id = snippet.id
  #   Snippet.find_by_id()
  # end

end
