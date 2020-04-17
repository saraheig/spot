class LanguagesController < InheritedResources::Base
  # Get the referer request (url)
  def new
    cookies[:return_to] = request.referer
  end

  # Get the language from the cookie (user choice) and redirect to the initial page
  def create
    cookies[:language] = language_params[:code]
    redirect_to cookies.delete(:return_to)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through
  def language_params
    params.permit(:code)
  end
end
