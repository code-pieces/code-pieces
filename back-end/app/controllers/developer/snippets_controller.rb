class Developer::SnippetsController < Developer::DeveloperApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy, :star]

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
    # selected_snippet(@snippet)
    session[:selected_snippet_id] = @snippet.id
  end

  def edit
  end

  def update
    if @snippet.update(snippet_params)
      redirect_to snippets_path
    else
      render :edit
    end
  end

  def destroy
    @snippet.delete

    redirect_to snippets_path
  end

  def email_snippet

  end

  def star
    is_star = current_user.star_snippet(@snippet)

    respond_to do |format|
      format.html { redirect_to snippet_path(@snippet.id) }
      format.json { render json: [ is_star: is_star ]}
    end
  end

  def stars
    @snippets = current_user.star_snippets
    render :index
  end

  private
  def snippet_params
    params.require(:snippet).permit(:name, :description, :contents, :created_by, :language_id, :scope, :tag_trigger)
  end

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end
end
