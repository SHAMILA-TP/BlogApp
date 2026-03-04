class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  helper_method :liked?

  def liked?(record)
    record.likes.exists? user: current_user
  end
end
