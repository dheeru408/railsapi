class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token


def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end
end
