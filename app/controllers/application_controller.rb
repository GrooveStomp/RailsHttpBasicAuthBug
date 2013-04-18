class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def initialize
    @authenticate_block = lambda { |username, password| }
  end

  def authenticate
    authenticate_with_http_basic @authenticate_block
  end

  def home
    render text: 'home'
  end

end
