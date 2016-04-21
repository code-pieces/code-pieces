class Developer::SnippetsController < Developer::DeveloperApplicationController

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user
    if @snippet.save

      redirect_to developer_dashboard_path
    else
      render :new
    end

  end

  private
  def snippet_params
    params.require(:snippet).permit(:name, :description, :contents, :created_by, :language, :scope, :tag_trigger)
  end
end
