class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params

  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges,
  # import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # As per pg 135 of Agile Web Development with Rails 8:
  # - connect Active Storage to our views
  # NOTE:
  # Only needed if we're storing files on disk.
  # If using the cloud you don't need this line.
  include ActiveStorage::SetCurrent

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end
