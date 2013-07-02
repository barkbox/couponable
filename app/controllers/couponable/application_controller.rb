module Couponable
  class ApplicationController < ActionController::Base
    def index
      render :text => "Couponable #{Couponable::VERSION}"
    end
  end
end
