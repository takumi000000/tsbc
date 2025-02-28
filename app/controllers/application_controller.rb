class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :initialize_info
  private

  def initialize_info
    session[:info] ||= {}
  end
end
