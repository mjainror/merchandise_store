class API::BaseController < ApplicationController

  protected

  def render_success!
    render json: { 
      success: true 
    }, status: 200 and return
  end

  def unauthorized_access!
    render json: {
      success: false,
      error: "Unauthorized Access!"
    }, status: 401 and return
  end

  def unprocessable_entity errors = ""
    render json: {
      success: false,
      error: errors
    }, status: 422 and return
  end
end