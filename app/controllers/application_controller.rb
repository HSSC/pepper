class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def random_string
    [*('a'..'z'),*('0'..'9')].shuffle[0,25].join
  end
end
