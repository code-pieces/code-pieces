class Developer::SnippetsController < Developer::DeveloperApplicationController
  def index
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user
    if @snippet.save

      redirect_to snippets_path
    else
      render :new
    end

  end

  def show
    # binding.pry
    @snippet = Snippet.find_by_id(params[:id])
    # selected_snippet(@snippet)
    session[:selected_snippet_id] = @snippet.id
  end

  def edit
    @snippet = Snippet.find_by_id(params[:id])
  end

  def update
    @snippet = Snippet.find_by_id(params[:id])

    if @snippet.update(snippet_params)
      redirect_to snippets_path
    else
      render :edit
    end
  end

  def destroy
    @snippet = Snippet.find_by_id(params[:id]);

    @snippet.delete

    redirect_to snippets_path
  end

  def email_snippet

  end

  private
  def snippet_params
    params.require(:snippet).permit(:name, :description, :contents, :created_by, :language_id, :scope, :tag_trigger)
  end
end
