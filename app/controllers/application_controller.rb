class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def one_by_kind(obj, kind)
    obj.where(:kind => kind).first || obj.where(:kind => kind).build
  end
  helper_method :one_by_kind

end
