class ApplicationController < ActionController::Base
  private

  def current_score
    @current_score ||= session[:current_score]
  end
end
