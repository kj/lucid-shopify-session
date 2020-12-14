# frozen_string_literal: true

require 'json'
require 'lucid-shopify-session'

module Lucid
  module Shopify
    module Session
      class Middleware
        # @param app [#call]
        def initialize(app)
          @app = app
        end

        # @param env [Hash]
        #
        # @param [Array<Integer, Hash{String => String}, Array<String>]
        def call(env)
          Authorise.new.(env)

          @app.call(env)
        rescue UnauthorisedError
          Rack::Response.new do |res|
            res.status = 401
            res.set_header('Content-Type', 'application/json')
            res.write({
              error: 'Invalid session token',
            }.to_json)
          end.to_a
        end
      end
    end
  end
end
