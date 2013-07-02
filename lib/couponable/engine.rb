module Couponable
  class Engine < ::Rails::Engine
    isolate_namespace Couponable

    initializer :couponable do
      # ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
      ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/admin']
    end

  end
end
