class Developer::SnippetsController < Developer::DeveloperApplicationController

  before_action :assign_user
  helper_method :route_snippet_path
  def index
    @snippets = Snippet.all
    @snippets = @user.snippets if @user
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
    @snippet = Snippet.find(params[:id])
    @snippet = @user.snippets.find(params[:id]) if @user
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

  def assign_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def route_snippet_path(snippet)
    if @user
      user_snippet_path(@user, snippet)

    else
      snippet_path(snippet)
    end
  end
end
