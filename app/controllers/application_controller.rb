class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordInvalid, with: :show_errors
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  protected

    def show_errors
      render text: 'hello world'
    end

    def render_404
      render :not_found
    end
end
