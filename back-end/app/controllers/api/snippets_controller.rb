class Api::SnippetsController < API::APIApplicationController

  def index
    @snippets = Snippet.all

    render json: @snippets
  end

end
