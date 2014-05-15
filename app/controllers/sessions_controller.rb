class SessionsController < Clearance::SessionsController
  protected
  def url_after_destroy
    root_path
  end
end
