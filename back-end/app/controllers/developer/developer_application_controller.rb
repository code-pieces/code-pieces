class Developer::DeveloperApplicationController < ApplicationController
  layout 'developer'
  before_action :current_user_snippets, :require_login
  # before_action :require_login

  def current_user_snippets
    @snippets = Snippet.all
  end
end
