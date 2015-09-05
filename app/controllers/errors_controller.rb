class ErrorsController < ApplicationController
	skip_before_filter :authenticate_user
  def not_found
    raise ActionController::RoutingError, "No Route Match #{request.path.inspect}"
  end
end
