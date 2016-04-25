class Api::SnippetsController < Api::APIApplicationController
  before_action :set_snippet, only: [:show, :update, :destroy]

  def index
    @snippets = @current_user.snippets

    if params[:for] == 'sublime'
      @snippets = @snippets.map do |snippet|
        snippet.as_sublime_snippet
      end
    end

    render json: @snippets, root: false
  end

  # GET /snippets/1
  def show
    render json: @snippet
  end

  # POST /snippets
  def create
    @snippet = Snippet.new(snippet_params)

    if @snippet.save
      render json: @snippet, status: :created, location: @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @snippet.update(snippet_params)
      render json: @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @snippet.destroy
    render json: "Success"
  end

  private
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    def snippet_params
      params.require(:snippet).permit(:name, :contents, :created_by, :scope, :tag_trigger)
    end

end
