class Api::LanguagesController < Api::APIApplicationController
  def index
    render json: Language.all, root: false
  end
end
