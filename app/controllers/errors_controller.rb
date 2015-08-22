class ErrorsController < ApplicationController
  def not_found
    raise ActionController::RoutingError, "No Route Match #{request.path.inspect}"
  end
end
