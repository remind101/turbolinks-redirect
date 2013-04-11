require 'turbolinks/redirect/version'
require 'turbolinks'
require 'jquery-rails'

module Turbolinks
  module Redirect
    ##
    # Allows client-side redirection for rails ujs ajax requests. The client
    # will look for HTTP status code 278, and will use turbolinks to request
    # the new page if found. Status code 278 has no real significance, except
    # that it is mentioned for this purpose at the following stackoverflow
    # conversation: http://stackoverflow.com/a/304654
    STATUS_CODE = 278
    ::Rack::Utils::HTTP_STATUS_CODES[ STATUS_CODE ] = 'Turbolinks Redirect'
    ::Rack::Utils::SYMBOL_TO_STATUS_CODE[ :turbolinks ] = STATUS_CODE

    ##
    # All methods that will be included in ActionController::Base.
    module Concern

      ##
      # Override #redirect_to to automatically respond with a status
      # of :turbolinks if this request is AJAX.
      def redirect_to( options={}, response_status={} )
        if request.xhr?
          super options, response_status.merge( :status => :turbolinks )
        else
          super
        end
      end
    end

    ##
    # Rails integration
    class Engine < Rails::Engine

      initializer :turbolinks_redirect do
        ActionController::Base.class_eval do
          include Turbolinks::Redirect::Concern
        end
      end
    end
  end
end
