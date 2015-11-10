class ApplicationController < ActionController::Base
  protect_from_forgery
  clear_helpers
  rescue_from Exception, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  before_filter :authenticate_user, :reject_unverified_user
  private
  def render_404(exception)
    raise exception unless Rails.env.production?
    render "errors/not_found", status: 404
  end

  def render_500(exception)
    raise exception unless Rails.env.production?
    render "errors/internal_sever_error", status: 500
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    elsif cookies.signed[:user_id]
      @current_user ||= User.find_by_id_and_auto_login_token(
      cookies.signed[:user_id], cookies.signed[:auto_login_token])
    end
  end
  helper_method :current_user

  def authenticate_user
    redirect_to [:new, :session] unless current_user
  end

  def reject_unverified_user
    redirect_to [:unverified, :account] unless current_user.verified?
  end 
end
