# frozen_string_literal: true

class ApplicationController < ActionController::Base
  impersonates :user
  include Pundit::Authorization
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :track_action if Rails.configuration.ahoy_tracking == true

  protected

  def track_action
    ahoy.track 'view', request.path_parameters
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
