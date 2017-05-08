class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_filter :user

	private
		def user
  			@user = User.new
  		end
end
