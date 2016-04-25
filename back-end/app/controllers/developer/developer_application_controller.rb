class Developer::DeveloperApplicationController < ApplicationController
  layout 'developer'
  before_action :current_user_snippets, :require_login
  # helper_method :selected_snippet

  def current_user_snippets
    @snippets = Snippet.all
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
