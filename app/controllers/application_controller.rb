class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def url_after_destroy
    root_path
  end
end
