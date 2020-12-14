# frozen_string_literal: true

require 'json'
require 'lucid-shopify-session'

module Lucid
  module Shopify
    module Session
      class Authorise
        UnauthorisedError = Class.new(Error)

        # @param env [Hash]
        #
        # @raise [UnauthorisedError]
        def call(env)
          session_token = env['HTTP_AUTHORIZATION']&.[](/Bearer (\S+)/, 1) || ''

          env['lucid-shopify-session.shop'] = DecodeSessionToken.new.(session_token)
        rescue DecodeSessionToken::Error
          raise UnauthorisedError
        end
      end
    end
  end
end
